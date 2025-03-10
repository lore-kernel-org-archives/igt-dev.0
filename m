Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD48C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 17:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7691310E058;
	Mon, 10 Mar 2025 17:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5fJ2u0Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925DA10E058
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741628151; x=1773164151;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Oxt7an644+JqxqD73G9Ve9Gt7xR1B5Nxfz+mHw1n0Kk=;
 b=a5fJ2u0Ypk9CA2h7f7Ryol3zZnsht07xsJC9hh6KalWd8snGuQY8pkUW
 AwTmjMq6nAjNyajYblRbOv+o/wmOeo59rluORkRtHNfbCH7qZM+fj3LU9
 r1cIA7OyzdLsr9Zc//NZIOdEH/T/G+BcIluksppklsXf8LwkGEetiKVbB
 xvjIeDR4fd8EY/vftdHxv7DBkaDRifvmQSHUc+f9g8YkllTnsU2Q8sIq2
 UFjHC2sQnFomY4LP+D9IVUGPTckGBnD1SXKAV7irmzelpjEyzCQnyWUIy
 jUJsklU59AAIdgyZWfudAS//Jed5awiG+5WhKJl8TmFCH/DkMQFuws1qK w==;
X-CSE-ConnectionGUID: ncHc+2x2REiUcBwyBPxYMg==
X-CSE-MsgGUID: lC9XJADFRGKv0j/g3GX0Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="67994364"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="67994364"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:35:50 -0700
X-CSE-ConnectionGUID: +wXElHxzQMSc8SfQdP8otw==
X-CSE-MsgGUID: iBIVp2GLRE2BnmS1uZ/nYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120074091"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:35:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 10:35:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 10:35:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 10:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zM/jH7rs2o430ORvc1Qcj9YQNgmxBXFf1bhVRmFdnYCQtc/5LV5NplDIIyqj2f7pzu4nVmvALhuXg2OW8ysmB4U6juW/L8oxySnIggh+AWVb7Fpy2SxA539K0ZID9dAhv6FGLAyfSM85aw7NSLSZyQIYY/roH4/iQ+IJgF1MOCzOwL9Hy1qtfrzuaowrzYETKmEataa+oESutk5PC1zguXq4pQqqMu6aBKL/wiYPrW8DrdCW7yeoB0bs9LxJkHa0bWnwcj18etQkz83gVucSsSqNRxl8O2JEjyUNEoq7XCj0r6V154Ej666GMdlUrjKDDIcDEz5TL0gIwMLNMymqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ipr0rHKMdcEu/p5uiQbC6cHk5nySoRj72vzK8tTQ2n4=;
 b=QDi0MimduSe/TBt5I5ovy860Wz+SnkoSp74FU6s3r9IFAdEPMYgfkjvCV+HSBasdAtxPkr/LOncHnk51MNHCotvykDI/kehvhG8OIeBFGmW33mWpGmSillqfVutATWo0LIjv3uo4NOa3OGVQIDNW3UvoV7ulQ7KPfFMXAOsiBKpqHFxUGZ8EDXydhSWis2FVOuprzvW2Cj5+Ti/bdtz94PDn834LkMUB4qVPpFzu4p8zt08/7s8LBP/XoVEVZKJKe86/lvwxO/z7IqVxQcVZyFu09yFy3phQ7R1smpE5xCQMqw6ouIXdoOP8ixR/j4MnMLdMvzDcMws2CQfPQujVww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 17:35:41 +0000
Received: from SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d]) by SJ0PR11MB6696.namprd11.prod.outlook.com
 ([fe80::c25a:5de1:4bf0:4d8d%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 17:35:41 +0000
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Subject: RE: [PATCH v2 i-g-t 1/2] tests/intel/xe_drm_fdinfo: Check
 prerequisites for utilization subtests
Thread-Topic: [PATCH v2 i-g-t 1/2] tests/intel/xe_drm_fdinfo: Check
 prerequisites for utilization subtests
Thread-Index: AQHbjtKaKkA8YJi3KUybvlfifmnmbbNspoTg
Date: Mon, 10 Mar 2025 17:35:41 +0000
Message-ID: <SJ0PR11MB66964ED59A4D0640268A8960ACD62@SJ0PR11MB6696.namprd11.prod.outlook.com>
References: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
 <20250306200118.1771514-2-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250306200118.1771514-2-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6696:EE_|SJ0PR11MB5895:EE_
x-ms-office365-filtering-correlation-id: 35d91b1f-b6ae-453c-2329-08dd5ff9faad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3QJwoFECVX/XZZI5C0xzEH1hqwGz2Xq7TDNVlrWAcwK6uOGYns0SQqi/87Mx?=
 =?us-ascii?Q?aKHFU6oJupkjBXjkUOwZ21ySzRZ7e929yhRks0iR6mDjcEHcTVdFW69gkyQx?=
 =?us-ascii?Q?zIx3XNmSCjcv29pr5BnS/8eMGlaEZLBvmlhnpo43k1ftlVzCGi3Stfwqodst?=
 =?us-ascii?Q?27mjzClVUSydIkV90APXqW1Ni5ZMzoofzyoy12tQkfLnx/tF7jbSqUOR65Vg?=
 =?us-ascii?Q?xm+Occ89J0ZeZ79fl5YqrpxUrJJLJ2JtGeAsjzZ/jLF+Ja4eSYe1aRAVyrL7?=
 =?us-ascii?Q?ZyigXpbadb2+OsyxZZDXMJ+NKLL9cZNIpuyzdr9vBgy6F+4DZMWn5zGCFb8G?=
 =?us-ascii?Q?b+c46T+y/PWEyP0pKa1VZmNyZyOeVTiEpbstytECV8SrrvOoVISKd8ci1T7o?=
 =?us-ascii?Q?sWQi8x7C1DE9rdoN9KfhdQZRHhV915UTrhHyfGYN863PC6TJByLKHc272hgj?=
 =?us-ascii?Q?s3UDNWY+4jVbpmVIVUsgqCG3PpGvuUJabJQ3IH2/wjBawAqCgoTfv1x5h9MM?=
 =?us-ascii?Q?KdpufjgBaeMqlB9HkbzRqbUOu8CeEZuh5Nkobzj1+fVW2UgHLbPfaFSz1eDW?=
 =?us-ascii?Q?4k+sL08SYYZonT2mJel+N0usr2YeI4mkuoe7hNrdycwwOi/fZqN3Ix+x1MCt?=
 =?us-ascii?Q?ufBfgVVteCcwhEG3+NH7uoEKswMdpnGObRy0LTLoY69x5nZXyM0+dPhgA1Iw?=
 =?us-ascii?Q?MEZl7ekyyXTdLaGBIkV3oMxVpngTD2BD0NIpBmd9wmlytKqQsV4GgHkK/OXv?=
 =?us-ascii?Q?66B2Voi38kWM7ugWWS/YzsZuoMdnMhfGX6VYSqYxDDc0iHAVK9fFwwWvYV7c?=
 =?us-ascii?Q?L2hWkc9mZNRZWeCTNa8hdK1kTY80teVGgyJNMs10jMZL6zowGV02y6TW3353?=
 =?us-ascii?Q?p7XQ3cx871pm3j6LRJlv+rY71NG7a7/wRvHvJcony99MYftJ9WkrTy3DAKha?=
 =?us-ascii?Q?nop52jqrRyiR+E8TJnYEpN1aPpmaZjPR3kKyOaWw3Z7L0xt8DfXJXfYSe8+O?=
 =?us-ascii?Q?Ega5hDqzA708tdNNsC335prS0WacUHELPeEjtQssHXsl6CwnhdVdfvmQM6dg?=
 =?us-ascii?Q?d2FdtaXNQi6y76Pwm0wIjRHbonqSd2venEThkUKtQF102NaSU7HAVge+g0h8?=
 =?us-ascii?Q?BnwDetkGYWFK1krWcTup+sfyhmP+1fZCwLHCowKRHpa8379/NERmwxcW/IXa?=
 =?us-ascii?Q?ZZSemu2wAKPqxVFDtKl+1bgFjC8Me9urjZ5OeUuLz9mXz5HfACQfG4JHRiIS?=
 =?us-ascii?Q?hXXIgxcW/lxtaajpidDtf+jkgBbqx2yX/tndzh5EVw+ddA8TTMvZuvy5BAsq?=
 =?us-ascii?Q?fINPWSGrE5EkoxM2NRxjyUN2UQRmpIF3f8kjPCPR2mzas4nUnZN2uJGLCm2K?=
 =?us-ascii?Q?bK00KHViEd3XBgLmYhfqcCTXgFFPMeg3M4dQrJ8OyHckQ5kxb3IRi2Ns2zhK?=
 =?us-ascii?Q?2YI+1F6sRS5RAZsT8RUkDiT6VGydHvPy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6696.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZId4dY1tBmvhCJrYNKLQqiJ/MjCAvkpG4g6lb/fEqZAyfS2ohikSeY5kfWJk?=
 =?us-ascii?Q?Ckc1pRhZnUnT8KNMmvdNU5q7OzdSOvk6GX4rTii5is3eNN/MdSC0J8MbtInW?=
 =?us-ascii?Q?vBLR723VeaXfhVZiIOc6WWI5iykHUuQGxOdD7U5PZ7PRH6LYblEVqgmyyZHo?=
 =?us-ascii?Q?jG8xrxQ1BApynkpIoArGSyOLS3TsNbAamLLOQqgzM0oBXbi1g1BPQXl/fpZ9?=
 =?us-ascii?Q?EGEwNYknwyiRpw8NhBjnpCL1ztCmzf7VBCPAsnC30vyhu/02/H1gimPgiOqQ?=
 =?us-ascii?Q?pkff/jRmZHsrJTQKFN+6VlPhYOt1YyuOWeb806gbmy+Xf7sV1F8T3QSC6kTd?=
 =?us-ascii?Q?ShOwth3/muYHQkFbzUzBRlVcXADJJ5JHEJQlfNWU8pp60xp3yaoXdGAHQwbm?=
 =?us-ascii?Q?Wsasq9ZCyBgLuGtopb+I/dFwmiExbR1/FRAbDOcF2jfVC+L0dPAETlxVWVzU?=
 =?us-ascii?Q?K+OhgIhH8PCrKDGOgOnIfhqaUUB0g1TFuBHlSfhV8/kVScsdgESUdFyH7146?=
 =?us-ascii?Q?2lNmJTNI9NOdhX98CqZ5HMCvHUQ+GAb2eZGP/DDWnbbjd+Xd0hdo0gk6rx5/?=
 =?us-ascii?Q?V1uji5M7K58moMwHXlzIa62TBXFB3XKX54YAVDne43JX41r6WUhdGOzYvUmr?=
 =?us-ascii?Q?UEogQBd1yklcOXczHfwQrr3gauVRqrElBBY/hkJ3QcicV31Bgq5hgeKrl5se?=
 =?us-ascii?Q?slpVZkJ4hTNhXX8Qf0Lf5nFZ//U/KUjUntl4uYNaR7nPUtRIRrqzRpf1Ef49?=
 =?us-ascii?Q?OPfduJa31RmGZDmy38PMySu2aCfqCcM4+gWihGsXTlPfqlR2qhLf368GMXIx?=
 =?us-ascii?Q?objfLGyOLCKoyyNaspXV/lylkTfiDRWk5dGOyC9bdVE5OfxgUcXU/mRmvuKh?=
 =?us-ascii?Q?FqbC9BUApQVNNa5vh9eQDqSf9ic8Fp9f1Szj5f4m886j4f5NjtUjkSnfV2BM?=
 =?us-ascii?Q?fNtuyERdKzzfZZu9LuL3PfwmVl9vMPzaLsUWr3bXwgW0FeKhRiSpEio2cvYE?=
 =?us-ascii?Q?oj7AloQTQ+LyNk08bJy0wkzdiTLjYE0OJJuH77HoQsoSLNabv0bJGvlWk1nX?=
 =?us-ascii?Q?yVr1jbzp9Plf8hsN9equ+BOiU3EqJmA2c99d3kf3znCUvRRKyg/RIZcNElEB?=
 =?us-ascii?Q?wffRyyEke8+GR959Tn/qpGzXUpfTV5sJcXmTPQwgOEk1OyLcaVY/mQxzS+Yy?=
 =?us-ascii?Q?ybClyyqzbVbXEpbeWS4u8xjXVUqFi5Gwk8pvgKcl+DH+dJVDkKETXP5gHYe8?=
 =?us-ascii?Q?6dk1syI1TRnqbrVpHwaKcAOxIbT9cgMz1Ji5CNQ09o+91IzS5NG2dL8TSDeh?=
 =?us-ascii?Q?P+xfoy/iqak4zQJFvBlRycA78hRTSb4VtaUHPgDi+JfU1NExfiFEZmkx+oqt?=
 =?us-ascii?Q?6H1RTgultnOtaSWGvfZzuXWOODRKr6BNDnL2qyCEom/A3nnIH6RHuGQYVjav?=
 =?us-ascii?Q?KM3hMGUDnY3pdxHmnexrBGOqwAqCWRb2KQkWE2Ke+sMuIqJ08IR+rNxIyLTd?=
 =?us-ascii?Q?uMWI7EhN7zKERM47gJu8qIeFLRDYlb42229N60aOrlCrSfN/FT750172WhdL?=
 =?us-ascii?Q?hxz4II9Pp9JmhKrQhgihku2bhDzyhwAEt04+ReXR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6696.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d91b1f-b6ae-453c-2329-08dd5ff9faad
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 17:35:41.3085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dE/5H3URQLIZCO7DfoNLAW6xh2FNWlBxtkOOllOuK5RlKxFjD2e3h2Y6ubdp98hV5VeWVZIjQxq+2bLpILRjKviYV1XPwOm8WtWrF6a9ISc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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

Hi Marcin,

LGTM,
Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Marcin B=
ernatowicz
Sent: Thursday, March 6, 2025 9:01 PM
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Kamil Konieczn=
y <kamil.konieczny@linux.intel.com>; De Marchi, Lucas <lucas.demarchi@intel=
.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; Nerlige Ramappa, Umesh <um=
esh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 i-g-t 1/2] tests/intel/xe_drm_fdinfo: Check prerequisite=
s for utilization subtests

Introduce require_engine_utilization_data() to verify utilization data avai=
lability in each utilization subtest.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 54 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c inde=
x f17245bea..f166b73d6 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -358,6 +358,16 @@ static void basic_memory(int xe)
 	}
 }
=20
+static void require_engine_utilization_data(int xe) {
+	struct drm_client_fdinfo info =3D {};
+
+	igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
+					 ARRAY_SIZE(engine_map), NULL, 0));
+	igt_require(info.num_engines);
+	igt_require(info.utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES); }
+
 static void basic_engine_utilization(int xe)  {
 	struct drm_client_fdinfo info =3D { };
@@ -736,8 +746,10 @@ igt_main
 		basic_memory(xe);
=20
 	igt_describe("Check if basic fdinfo content is present for engine utiliza=
tion");
-	igt_subtest("basic-utilization")
+	igt_subtest("basic-utilization") {
+		require_engine_utilization_data(xe);
 		basic_engine_utilization(xe);
+	}
=20
 	igt_describe("Create and compare total and resident memory consumption by=
 client");
 	igt_subtest("mem-total-resident")
@@ -751,50 +763,69 @@ igt_main
 	igt_subtest("mem-active")
 		mem_active(xe, xe_engine(xe, 0));
=20
-	igt_subtest("utilization-single-idle")
+	igt_subtest("utilization-single-idle") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single(xe, hwe, 0);
+	}
=20
-	igt_subtest("utilization-single-full-load")
+	igt_subtest("utilization-single-full-load") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+	}
=20
-	igt_subtest("utilization-single-full-load-isolation")
+	igt_subtest("utilization-single-full-load-isolation") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLA=
TION);
+	}
=20
-	igt_subtest("utilization-single-full-load-destroy-queue")
+	igt_subtest("utilization-single-full-load-destroy-queue") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single_destroy_queue(xe, hwe);
+	}
=20
-	igt_subtest("utilization-others-idle")
+	igt_subtest("utilization-others-idle") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_others_idle(xe, hwe);
+	}
=20
-	igt_subtest("utilization-others-full-load")
+	igt_subtest("utilization-others-full-load") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_others_full_load(xe, hwe);
+	}
=20
-	igt_subtest("utilization-all-full-load")
+	igt_subtest("utilization-all-full-load") {
+		require_engine_utilization_data(xe);
 		utilization_all_full_load(xe);
+	}
=20
=20
 	for (const struct section *s =3D sections; s->name; s++) {
-		igt_subtest_f("%s-utilization-single-idle", s->name)
+		igt_subtest_f("%s-utilization-single-idle", s->name) {
+			require_engine_utilization_data(xe);
 			xe_for_each_gt(xe, gt)
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class, s->flags);
+		}
=20
-		igt_subtest_f("%s-utilization-single-full-load", s->name)
+		igt_subtest_f("%s-utilization-single-full-load", s->name) {
+			require_engine_utilization_data(xe);
 			xe_for_each_gt(xe, gt)
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class,
 							  s->flags |
 							  TEST_BUSY |
 							  TEST_TRAILING_IDLE);
+		}
=20
 		igt_subtest_f("%s-utilization-single-full-load-isolation",
-			      s->name)
+			      s->name) {
+			require_engine_utilization_data(xe);
 			xe_for_each_gt(xe, gt)
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class,
@@ -802,6 +833,7 @@ igt_main
 							  TEST_BUSY |
 							  TEST_TRAILING_IDLE |
 							  TEST_ISOLATION);
+		}
 	}
=20
 	igt_fixture {
--
2.31.1

