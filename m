Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4487C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 14:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640B10E3FA;
	Tue, 22 Sep 2026 14:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRDWCsnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09F810ED68
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790088925; x=1821624925;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8sdu3y+AKb1tICPsyKQ4dNbQrVFv4GUI2+TZ5RSVrLM=;
 b=IRDWCsnzm/4SOnO5ZV+SJuZCJgh0Q7FhBdnpgUBCsZ+Dwfri2TJz1Omu
 VKD8QDiTlYXA5cByWkr4Rh2SmMYGpegtUUaL6pCnMpE4v/N3VAEhXwOhk
 amAVF2NSF9cxJG/d/VJD5pqBJGBh6jU8Oi28QwuTbUpCM3x5J8I4qT+My
 Aip+C2I0O45yv3xTrlhXqR074jLBuGOR6a0FzCzQj2dFlHVi/EW1CBurI
 iON+ssb8V7Z4YSzg7dcwMMqJZGyN7H35QlDyo9yCQVjNB4SzQriWO7e9A
 z8JSYBj82cfHOJp29lh4/YwLcqsfLXQs2fUXSTR8bTFdzsw+Zz9Z+HGtF w==;
X-CSE-ConnectionGUID: 2vzklliYSvC61JcS5fcy1Q==
X-CSE-MsgGUID: SY6YTCyGRluBLzKejQp5AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90721794"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90721794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 07:55:24 -0700
X-CSE-ConnectionGUID: pgqYMkINRCGRrxgawPXriA==
X-CSE-MsgGUID: DttJ4QubQYSx0zwlqGIYVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272368977"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 07:55:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 07:55:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 07:55:24 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 07:55:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNJVxzDgBekShD248HnWLKBsnsOrSULvhenGJH6B+aTeYxqQl0WE7CbT0PpJEv5/EDYgob19e18SJ8HY1INMzxkp5Rw4PN+NjYqR01eocdq6k1YInPwDFAewHKyuO9+I/1MKykq/NG/6Iq/5qvrflfey8kqSEBmGoeFJ+/jNAm/ohjj6KFbpa/nfdTyugid6z8jAG/Cy4SzSu/BdA+X+x88AENi4v7Y+yOyOOg5PrZjPn+WEZE4s9gAiMWAxrqSpfRMU8PIwVvmxsW0dvi2QP7yJ2CaweOZNby2F5u/Iw+AA/ql5LNEqsfK6+/Lb4e7AOCuqhPj9PX9RmkF87342wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1t/dr1NJG9E5M8TfCy5KMB/39a/kqJqpk3Wp4T06gY=;
 b=RYoQea6cwIuMhdoh1VK3hAd1svUggCCbJVW4uZPf2jm/aHakFNb+CHnqblqxlQM1Kd4iWiSYXpRiZSpaJCnQPPq3r9HJmLTcglnkoJzRp1eV4Gf9KPVM2FS0OBYUOEqFcTdx0aZv0RfX1q94t3trn3K1Qd2Ds0GccPJxqRMi0QqjYjXrVSg5pJ1byZ2Vuf11/EAkJrobECOqQj3lGQ0eslVLwLS0WAiDAbD/HIMXiU+DtXfwQiG+OWvNulSRX/2LKImsMaJc7bSIcSQ2NzpUhNZ31lotpleqdlkJ3f9BFIoK2K68HOBtohRF3luk52iWvt5JhhFIaeTIwQK0FP/Kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA1PR11MB8793.namprd11.prod.outlook.com (2603:10b6:806:46b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:55:20 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 14:55:20 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 07/13] lib/i915/i915_dp: Add a Type-C port mode query
Thread-Topic: [PATCH i-g-t 07/13] lib/i915/i915_dp: Add a Type-C port mode
 query
Thread-Index: AQHdRZS4ebQCiGQ4J0mu3kBj/+9LlbbauE1g
Date: Tue, 22 Sep 2026 14:55:20 +0000
Message-ID: <PH7PR11MB67963056D64F81DD3949BCEFE5832@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
 <20260916044801.1279102-8-kunal1.joshi@intel.com>
In-Reply-To: <20260916044801.1279102-8-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kunal1.joshi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA1PR11MB8793:EE_
x-ms-office365-filtering-correlation-id: e8e26960-5a9b-4240-3344-08df18b985ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|10070799003|1800799024|22082099003|18002099003|5023799004|56012099006|11063799006|4143699003|10067099003|3023799007|38070700021;
x-microsoft-antispam-message-info: 2ZM4dnxIYWK1C5WxU8EdzNNYlVXvDdyfPU2cdZ8N6+iuVEfv/8AWCOCx9FAjcoVyzqw34dQdt2RHqc/qQ8p1vjP46WLpwA8GbSZTvfUpLQg1Px8532kzoYODri11ZtU7VE0bfSQUx9hnffhXwOY8s16UK0EAwZNXetAq1URCt7wWM/8t7A9ogxkYKQTBbrmJ6sJRDGZVAtFqB/9rINodhnLxsMqamwdxMDDLMV5x7gnljxFvMg5dF8BgG6Aa2OTfYq76/XLH4EGrI5sQNzWaY57zydcv1xImTrj6o4Rhx1i/RzCOd9ifoMOYxpIr6cj2Avzhv7bdGC1AJwu5ziMXPOQBIg2kSXlHeXsDHkmkYxSDG5BdCK11E26Pl2PRWaqKlj3kuKgQom7C25sA9o81ws3FGZ1+Xk81/E3i7rN9zALKhRKUbHqR0K2FDsJt4y5Fzh1uNa9JZdjk00eNIilaF0G6D7dQI2dQ4bcXL78PL4TVfsrKOAELP07YsAwYOMlmaosqsWmh5E4IXnBbzknT3h0VmTiRHps3lk7iOlawus/n46he3+wICG0Oh0b2Mmr1hCwtPykapneHIM2A6rtdHUP8OVxNZz+U0cgwJ7U1wPSBQd9+xm5TfjrbAhVHSNVW3s4SH0Vv05KK1Yd9sjBD7dB11oE/zXUNLdBDQ35RriYJJYqk0FTopIPmHcUJ23H2/myrmkPUDvd3NFQ7vjhwN7TlxqKmXYFELtqjWIlabsY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o/QtqFMcvfVpluqsMGa3DQZXlNxuc+gMoC3z88TS1/ag9bTsTRQb+MY1ZySZ?=
 =?us-ascii?Q?pcKyxWlJfqY3YBKsOJWV1HN2mdyeBRMTELVh7udZ9FHhLDUyUzZGP9+Q8RQW?=
 =?us-ascii?Q?SIKuZrxM8Kv+LKc46rzGFphKw3v8UDmpTYaZkC7e2fs0WT9KI5YoDHkZZrSd?=
 =?us-ascii?Q?ZX+o/mkhH8LJaCkjmM6G/MmfRnU/XrrqdJRGyZ59nqTwgwVLv0igt/xjlo/h?=
 =?us-ascii?Q?Jo75uDL7Fee0YlamyTu76ilBDKV74XyPbTcNEKTer0rMBcbo0TVO1qDpy2Si?=
 =?us-ascii?Q?an7Kdtw2L/FD5Zz98kx1xDdtstv7gtZucSCvnfIm/Chp7Pv2IonKShCvWquV?=
 =?us-ascii?Q?RNGK33SpQbLSLUc4D1NFi8yvxaYEJqfurZS2EmMq9dClQXAGlyzxlRvdtsAd?=
 =?us-ascii?Q?zhBCk1NY2yOqCSgFJiItuZw29yAWWrulRj+dblj8bUMNXBUFt0ec4FKKKNwG?=
 =?us-ascii?Q?3yd9l1egYjanPBxkJ+YwwWwZK8ohcV9RfNqS/WczUynS7gMoZoutUasQjHMN?=
 =?us-ascii?Q?uJmhi7nzBlYA73VFN62DbyFErcANKYn5W4TvGMTN3ZThwLL6FGc3eebQ29Si?=
 =?us-ascii?Q?6jvNAY4lAtnCaoUXaCX8ekYqUP7ATEEB7QrwupLHnUkxQia6Uv2GlhRiF8PA?=
 =?us-ascii?Q?GEoxS2pffX8/aW/GPVsrayeaOV6Dqfoa1wUVN3tJH5uc8GtZALGLF+giMVRt?=
 =?us-ascii?Q?pju1qPmxCC3H7nPXiN82aJMvmVhIcSR7GZ7cV7eNrNJ1lIgmTtU85mOUyk79?=
 =?us-ascii?Q?KnrMZiE62kdJaZvDz7J+1VBXGxsE1GneioIqPU4DavBnq6uk6lP37B8fkh8c?=
 =?us-ascii?Q?XojJn6e5CER7YX74YJNOCWKlVqdzT4wc/w9E4Kt0DpV5MHkojrzAng+LlAMw?=
 =?us-ascii?Q?Fe4hsROf0Nr29uBx5qFd6pad1ciV2Os7F1l16qNrVRW+MSoj5XWdxCxF5hVp?=
 =?us-ascii?Q?c9EdkKOdXsByd6LYNCFnTKSBH4+bxXJCRwhqAHwyOTjwIQvqaol0I8FeThya?=
 =?us-ascii?Q?f/pqxKe5YoxAnqC+tiY1HWgIDRc4PN4WJ7uaIxBS7kVCAzw82kTD8QyNJZQk?=
 =?us-ascii?Q?mo0vEXijVeJhvhPdGyaku70TNdeTL+3bkUHhddLVW6BrDcsF7VmYDz1pI+vO?=
 =?us-ascii?Q?UB/1nkYfPLV3LWQyYZM6KfkOxJMucisZHCg2HhgvCoMv1kEz78KYdju0gaYW?=
 =?us-ascii?Q?JfnBXUwCwWs25d6AzLdYe11ODh0/Cyv9t1D4HzP5dcniw84scLDqLnnvWmgY?=
 =?us-ascii?Q?/xrAn0uujgeatY/ur6L9mQpWDzaGOG2I87WudGOxt35m2cFrr2EVsszh9bL7?=
 =?us-ascii?Q?CAyZnZpQoWVcKkAxry/Qnxuk6m1JA9YAhqwcRjsgmP584MK7e0YmlYkHoYB5?=
 =?us-ascii?Q?Rpl9El+NE+W9TQNczrVbZGG7MPO+hKb+DjFcpzPlz0qo8Bt8xA9Is7QEeD50?=
 =?us-ascii?Q?QbEp8iRN3ar4zkZvaLIJ8xos23zNc8VRf+yLUTs3kTEYODRWFAnmhF7IhOLd?=
 =?us-ascii?Q?S7U7zC8y1KwKBgiKdwvhrCIQWVTryuCWvtKWhRh3wquzp8HeX9ln4fik6C28?=
 =?us-ascii?Q?WKiM1b/dhqp9xnl3Dx1VGdxZT9wOFwRxNqr2TN1Z1LBO7mc8K6mnEpVKeHH8?=
 =?us-ascii?Q?fnXZGG7r2NFtdfE6VKOD3oZwCHAf7zNvndhU7++hSoOnBQDnMVEacAPPVZQe?=
 =?us-ascii?Q?Fem+QPApzJ0shSCICpl9bz3Bd3EBjLDRiDgTyO2NaJN2PRqqfZertbDqvAD+?=
 =?us-ascii?Q?0M582Rb24OrENqQ5/1rPMXPGJsTXg7znMRBnmmgV7VxIbv4gmQV/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uQXhqg+W+ksf/Jn2cNEgKSztKGgmKC4SgLha/LoCCfy8DaPeZWEv2uAWUr6Aa/eWtuyjiAea9sz72ztk6Lqqwd/OFOAtcbwhmKXjckIe7PShdUPf/V+D3z3nD21nb9jG/HAV4I1Is3LfqtXkmNd/A56EB2MnzFTexGj8f/buK/EhaOWcXEmeQRvkDXCVP4igHadsXaXsQFQvlUYd0CSj9NdJ/jzY5pXL1FPulxAuRVwpjCAq5k73f9mgP2J+/X7PoFkaZJplxmAGZ20A2jXd0goliu90N9FPCUAON4BG8wCosi2knknEWsiu+dQd/Q79h71Sgm3434jx+nx8WEhIxw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e26960-5a9b-4240-3344-08df18b985ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 14:55:20.4141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N7ONYH2tmdlCqTiZXPk1XJ6nurW50d20HvHoh3Lu30eg5BocotmlLx33o25UqH48HBqriRxZorhQ6UBzZlJMSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8793
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

Hi @Joshi, Kunal1,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: 16 September 2026 10:18
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 07/13] lib/i915/i915_dp: Add a Type-C port mode que=
ry
>=20
> Whether a DP link is tunneled over USB4/Thunderbolt decides where its lin=
k
> clock comes from: a tbt-alt link is clocked by the Thunderbolt PLL, every=
 other
> mode by the PHY PLL. A test that wants to cover the tunneled path has to =
be
> able to tell them apart, and nothing in IGT can today.
>=20
> The driver already reports it. For every connected Type-C connector
> intel_connector_info() prints
>=20
> 	TC Port TC1: mode: tbt-alt, pin assignment: D, max lanes: 4
>=20
> in the i915_display_info debugfs file, with the mode being one of
> disconnected, tbt-alt, dp-alt or legacy. A connector with no TC Port line=
 is on a
> combo or native PHY.
>=20
> Add i915_dp_get_tc_mode() returning that mode as an enum, optionally alon=
g
> with the pin assignment and the Type-C max lane count, which are worth
> having in a log line, and i915_dp_tc_mode_name() to get the driver's spel=
ling
> back for the same purpose.
>=20
> i915_display_info is a per-device file listing the CRTCs first and the co=
nnectors
> after them, so find the [CONNECTOR:<id>: block belonging to the output an=
d
> terminate it at the next [CONNECTOR: marker. Without that second step a
> connector on a combo PHY picks up the TC Port line of whichever connector
> comes after it.
>=20
> Start the search at the "Connector info" heading. The CRTC section names =
the
> connectors of every active output, so for an active output the first
> [CONNECTOR:<id>: match is intel_encoder_info()'s reference to it, not its=
 own
> block. Parsing would then stop before ever reaching the TC Port line and =
report
> a tbt-alt connector as having no Type-C port at all.
>=20
> Read the file with igt_sysfs_get(), which sizes the buffer from the file,=
 rather
> than the fixed 16 KiB and 8 KiB stack buffers the existing readers in lib=
/igt_kms.c
> use without checking for truncation.
>=20
> Note that MST stream connectors do report the TC line, since both branche=
s of
> intel_connector_info() resolve the digital port with intel_attached_dp(),=
 so an
> MST topology can be classified from any of its streams without finding th=
e root.
> Disconnected connectors return early and print no TC line at all, which i=
s why
> the root connector of an active MST topology has none.
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
LGTM,
Reviewed-by: Sowmiya S <sowmiya.s@intel.com> =20
> ---
>  lib/i915/i915_dp.c | 111
> +++++++++++++++++++++++++++++++++++++++++++++
>  lib/i915/i915_dp.h |  24 ++++++++++
>  2 files changed, 135 insertions(+)
>=20
> diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c index
> aba6aa8d5..89d1dbd4d 100644
> --- a/lib/i915/i915_dp.c
> +++ b/lib/i915/i915_dp.c
> @@ -35,7 +35,9 @@
>=20
>  #include "i915_dp.h"
>  #include "igt_core.h"
> +#include "igt_debugfs.h"
>  #include "igt_kms.h"
> +#include "igt_sysfs.h"
>=20
>  /*
>   * The driver allows at most 10 link rates over 3 lane counts, i.e. 30 e=
ntries @@
> -527,3 +529,112 @@ int i915_dp_get_next_lower_rate(int drm_fd,
> igt_output_t *output, int rate)
>=20
>  	return next;
>  }
> +
> +/**
> + * i915_dp_tc_mode_name:
> + * @mode: Connector mode
> + *
> + * Returns: The driver's name for @mode, for use in a log line  */
> +const char *i915_dp_tc_mode_name(enum i915_dp_tc_mode mode) {
> +	switch (mode) {
> +	case I915_DP_TC_DISCONNECTED:
> +		return "disconnected";
> +	case I915_DP_TC_LEGACY:
> +		return "legacy";
> +	case I915_DP_TC_DP_ALT:
> +		return "dp-alt";
> +	case I915_DP_TC_TBT_ALT:
> +		return "tbt-alt";
> +	default:
> +		return "native";
> +	}
> +}
> +
> +/**
> + * i915_dp_get_tc_mode:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @pin_assignment: Where to store the Type-C pin assignment, or NULL
> + * @max_lanes: Where to store the Type-C max lane count, or NULL
> + *
> + * Read the connector mode of @output out of the TC Port line the
> +driver
> + * prints for every connected Type-C connector in the i915_display_info
> + * debugfs file:
> + *
> + *	TC Port TC1: mode: tbt-alt, pin assignment: D, max lanes: 4
> + *
> + * @pin_assignment and @max_lanes are only written when the line is
> present.
> + *
> + * Returns: The connector mode, or I915_DP_TC_NONE when @output has no
> +TC Port
> + * line, i.e. it is on a combo or native PHY  */ enum i915_dp_tc_mode
> +i915_dp_get_tc_mode(int drm_fd, igt_output_t *output,
> +					 char *pin_assignment, int
> *max_lanes) {
> +	enum i915_dp_tc_mode mode =3D I915_DP_TC_NONE;
> +	char marker[32];
> +	char mode_str[32];
> +	char *info, *block, *next_block, *line;
> +	char pin;
> +	int lanes;
> +	int dir;
> +
> +	dir =3D igt_debugfs_dir(drm_fd);
> +	igt_assert_fd(dir);
> +	info =3D igt_sysfs_get(dir, "i915_display_info");
> +	close(dir);
> +	igt_assert_f(info, "Unable to read i915_display_info\n");
> +
> +	/*
> +	 * i915_display_info is a per-device file that lists the CRTCs first
> +	 * and the connectors after them. The CRTC section names the
> connectors
> +	 * of every active output, so the search has to start at the connector
> +	 * section, or an active output's first match is that reference rather
> +	 * than the connector's own block and the TC Port line is never
> +	 * reached. The block ends where the next connector's begins.
> +	 */
> +	snprintf(marker, sizeof(marker), "[CONNECTOR:%d:",
> +		 output->config.connector->connector_id);
> +
> +	block =3D strstr(info, "Connector info");
> +	if (!block)
> +		goto out;
> +
> +	block =3D strstr(block, marker);
> +	if (!block)
> +		goto out;
> +
> +	next_block =3D strstr(block + strlen(marker), "[CONNECTOR:");
> +	if (next_block)
> +		*next_block =3D '\0';
> +
> +	line =3D strstr(block, "TC Port ");
> +	if (!line)
> +		goto out;
> +
> +	if (sscanf(line,
> +		   "TC Port %*[^:]: mode: %31[^,], pin assignment: %c, max
> lanes: %d",
> +		   mode_str, &pin, &lanes) !=3D 3)
> +		goto out;
> +
> +	if (!strcmp(mode_str, "tbt-alt"))
> +		mode =3D I915_DP_TC_TBT_ALT;
> +	else if (!strcmp(mode_str, "dp-alt"))
> +		mode =3D I915_DP_TC_DP_ALT;
> +	else if (!strcmp(mode_str, "legacy"))
> +		mode =3D I915_DP_TC_LEGACY;
> +	else
> +		mode =3D I915_DP_TC_DISCONNECTED;
> +
> +	if (pin_assignment)
> +		*pin_assignment =3D pin;
> +	if (max_lanes)
> +		*max_lanes =3D lanes;
> +
> +out:
> +	free(info);
> +
> +	return mode;
> +}
> diff --git a/lib/i915/i915_dp.h b/lib/i915/i915_dp.h index
> c818b3937..883ac346d 100644
> --- a/lib/i915/i915_dp.h
> +++ b/lib/i915/i915_dp.h
> @@ -23,6 +23,27 @@ struct i915_dp_link_config {
>  	int link_rate;
>  };
>=20
> +/**
> + * enum i915_dp_tc_mode:
> + * @I915_DP_TC_NONE: not a Type-C port, i.e. a combo or native PHY
> + * @I915_DP_TC_DISCONNECTED: Type-C port with nothing connected
> + * @I915_DP_TC_LEGACY: fixed DP connection on a Type-C port
> + * @I915_DP_TC_DP_ALT: USB-C DP alt mode, driven by the PHY PLL
> + * @I915_DP_TC_TBT_ALT: DP tunneled over USB4/Thunderbolt, driven by
> the
> + *			Thunderbolt PLL
> + *
> + * The connector mode of a DP output, as reported by the
> +i915_display_info
> + * debugfs file. Only I915_DP_TC_TBT_ALT takes its link clock from the
> + * Thunderbolt PLL; every other value uses the PHY PLL.
> + */
> +enum i915_dp_tc_mode {
> +	I915_DP_TC_NONE,
> +	I915_DP_TC_DISCONNECTED,
> +	I915_DP_TC_LEGACY,
> +	I915_DP_TC_DP_ALT,
> +	I915_DP_TC_TBT_ALT,
> +};
> +
>  /**
>   * i915_dp_is_uhbr_rate:
>   * @link_rate: DP link rate in 10 kbit/s units, as reported by the @@ -5=
8,5
> +79,8 @@ int i915_dp_get_allowed_link_configs(int drm_fd, igt_output_t
> *output,
>  				     struct i915_dp_link_config *configs,
>  				     int max_configs);
>  int i915_dp_get_next_lower_rate(int drm_fd, igt_output_t *output, int ra=
te);
> +enum i915_dp_tc_mode i915_dp_get_tc_mode(int drm_fd, igt_output_t
> *output,
> +					 char *pin_assignment, int
> *max_lanes); const char
> +*i915_dp_tc_mode_name(enum i915_dp_tc_mode mode);
>=20
>  #endif
> --
> 2.25.1

