Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D7EF06E5
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 05:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB2210E07F;
	Mon,  9 Feb 2026 05:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdK51Ihq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB6410E07F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770614368; x=1802150368;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZetO7rlp5owoaMJCTNlcFhyOu/3uYx9p8+xmsplXn3w=;
 b=SdK51Ihq8dO/DRSLnz+ERJFn86IE7YsBNY39ugEj8wgDul0aaRNqpwZQ
 fvy0o6cCXv9xbmS0eL4tLX3MODciut23hdLPnV8q4UJAvKETot/Ttbfj4
 lSzCVNBQz/CFkvWFEfaBK/Y4GqY4dfb8HWzyFBMXa2CiArQxexf9lIblT
 /VaPXOq3JoTNXnPnBEFrjLq2Y9WFq+O1KrIGd/gSfx+uSUKwYYs6u5Aev
 g8ji5sy56srwgV0Bbi5fxjA2mqnFQ1a6Zl2uIEhsfsR5JTA4JlwnQIaoE
 7P+/OvpoZ9IBBUpcMD6X1AwNfjtb4w6S4U5H10ogJxk4khy4drAgtcDTd Q==;
X-CSE-ConnectionGUID: /PHarsFdQ6u6VQh3ADg81Q==
X-CSE-MsgGUID: 1BiaLv6pR46drk8eTaHrmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="70923521"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="70923521"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 21:19:26 -0800
X-CSE-ConnectionGUID: mb+nWjtcTXS3HPXX/IZsHg==
X-CSE-MsgGUID: KwUi4RioSxytzB+co4ZtHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="211532875"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 21:19:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 21:19:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 8 Feb 2026 21:19:25 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 21:19:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4MBc4HV0fPVupfuI45ykYRuArzKx63vUss07YIdx68/2qu++6wLcnvJxDRlLilQC4bfdOWbIK8K5blRs+IHavaKOixlOuYwDi9VVWAf/E/+rsMpKiWHlt+Yce5YQjIgFSLqIj8HhqxxRnyOgtVY3Nneg3ewHrJR3QkpxLic4Sl0M5L32pJRF9iJZHAm5zPC5/COVum0fHWRpldq0i3CkcMUiAVAh/Dfo88YxeajRbeRjxwVDPIbO7qDmb3/N+JKSOJ9tSgMF7FywkQqcyMM4HY8DcSwdQNFp9AxYUNhD/+q7EKa+GHXu4Fp6VlZhyPOig3Lf6T/DJXB8B5/eGuKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgVIg28QCwtK53NOpn+9sBVK/rkyKXRuYoZKgZ5cq7E=;
 b=YS74QjerNorDvFkgDYJkMCMJRWM6P5FxNrS0wg958m+hfvGEVmBAG2CTYKLUQB+3202Vj56ifgs04qkSQQzXfDNKLne0AzJvGjd4NOWXdGY4T0kG+NN26HNGUxK+D3fmQdNFNNn8PKuTkAbyqjewMxGYS9SkMD220oes/M+MqI4YTMowbxYxIQArtPW8kJlRSUBlYsmqjJYSVAKVxWt3g7jIpgqFwf0VStAxYk+lFHlQrnnsb9fRHjbMZtH6O7VwFDZBoSbxHzkJ70a+rJIwsVKHgbpXME3P+ho/+CFsaU9bmiQUq3JmtW+6mkZ74V9sfc3TqRo4d2ypTQWs7wc3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 05:19:18 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:19:18 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_plane: Skip cursor plane for source
 clamping
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_plane: Skip cursor plane for source
 clamping
Thread-Index: AQHclbBOEX5JKQLBvkWzrOD0Ortvc7V522Ug
Date: Mon, 9 Feb 2026 05:19:18 +0000
Message-ID: <DM4PR11MB6312C284AB33EDB2635AA7E49065A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260204083913.1048566-1-pranay.samala@intel.com>
 <20260204083913.1048566-2-pranay.samala@intel.com>
In-Reply-To: <20260204083913.1048566-2-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB8229:EE_
x-ms-office365-filtering-correlation-id: 37cb3489-0236-4f24-f1ba-08de679ac638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0ypkvqzhtNxEOrRrB6oyZkEAc4AJH9peEw9+vqx/3uVhXiBRhG7IyMqbQEFi?=
 =?us-ascii?Q?U0nBKQZZDXiPezPB1uy4GYZMHRMhSeGWCT3VNCoGGHt9Jt37aF4YjaasT2/2?=
 =?us-ascii?Q?Q49x7ctokLiNQj0HfZO3V0UltgVId975djUIlnEXPdpmI9ZOoobzTiArYoST?=
 =?us-ascii?Q?4luKn8ls/pcIVjBF5Xc6LHOXdq+2pseXYWRj0wLql1j3vkba3oT0+MEMzl6C?=
 =?us-ascii?Q?jC+rAQJYZDDHZsC4wsSYWIAsvi6kLbD4vidAtSyA0GLBLaf23aZ/vnF2Kbac?=
 =?us-ascii?Q?RwdPT6zyOYWQ3prh033lJF2M+4wgB4dTv4QQPU8ICLkZRegXhIndF2/cfJgF?=
 =?us-ascii?Q?as4ij30UR83ft3DTSbJOMhu/bWCo4Fp44mIZCylePXHCuwTJRkkyKv10dfG8?=
 =?us-ascii?Q?c+VRVHUmNyVK5wvOZeUx26Bxnwk8//hc/xaodN7fhyWRh3D5ui1J731LMJCE?=
 =?us-ascii?Q?fhWkbC9jRmXVkCJiAB5v/V0U+ogMzJyXHKDl2P9R41UQT38wQaTDefgjYAtF?=
 =?us-ascii?Q?hs99lJqQ8xaMIF/WOGlJIJr02TOc2a+aSdYIRCM5bcrqXfYV2LLs2Wix4IH+?=
 =?us-ascii?Q?2g0/GLsgax2Vz8Vn++F6musv7/dolwXX609ZVmZopCzqgV4EtI1S+V8sywL8?=
 =?us-ascii?Q?ajh1H80GipDNFtyTccZjsRwdTmWle+cDAlpSuBZWExmxh6PtmhOCtJaWgq9G?=
 =?us-ascii?Q?bUxiUfwzz3daURSZQ0jt/m+TNaNEJYXZ1m+qBvimkBdEiezs634MvZ0dqnp5?=
 =?us-ascii?Q?YgeHgUqBL8CDJ0MJWve5ERy/ZW6C2G1MT+gn9ndaDpO8lppMmMuXXrVgxx3P?=
 =?us-ascii?Q?//CcupbmZJjBa8R8iOtJIBEeeLWGhU9Yvm6E9dfY/F50+DO46070hmXjTood?=
 =?us-ascii?Q?th+jt4IiRKikdCousBtdNbt23wB3RtLYRx3tSFVofl4SjUgqCjDmrL4Slo4Z?=
 =?us-ascii?Q?eaMfwMrtX7sF5Ba1qiTINms3JYVYN8J882TBIHgZvejhlBnHUR3TyTRqMMQo?=
 =?us-ascii?Q?flUYmj4/yLmEeaAJSWHQ1uxAo7ttCYAA0kFQBYlFQlRS+igYvJTS+DqmMcEZ?=
 =?us-ascii?Q?H/B+jmVT4nK6aqA9h/smt2pdAmfrF5oZTTZ/R4zT9VF+I1NGW7qLziHv/2UR?=
 =?us-ascii?Q?P7P6q9QPX4h0qJMIr6efUq+FvCkyc7qdOcRuqXWPHg2yU4stP3sE1ZiaLp6a?=
 =?us-ascii?Q?jmfMKXPWMnP0cCcPOchIDuO12yY9TazPuTj2H5n1USnEwMhb51C0AIHuOfzm?=
 =?us-ascii?Q?dsqeA94PLvweW99AAluUP1bc9E7hSEWrCSJylDxyYtsJrMOdcL5FPKD/+FTv?=
 =?us-ascii?Q?2m9WGV7nSLujSWGkoxcfYpgXCNoqaY+RbzMta5NDWfLMsajjqxqNVCy3//Wv?=
 =?us-ascii?Q?eq0YzdJiBccVBgzqCGyu1CnIwZdOC2yzLGS4OhhP5Tvuo0eZd111Cl8q/bVr?=
 =?us-ascii?Q?P03Eit71GluzVQ0MoYifLD8SbGub1B61cyVDGtaE2c6SSNyNcktFnJYCYaP8?=
 =?us-ascii?Q?6YjmxqoSzcs2+m7UnsMQYSMscEUOQ3s455n3n2AthLJ1fUDbPLxSpeA7mZoV?=
 =?us-ascii?Q?bPl6gZq6GgWyKf/uKasL3FloXOm/TWrYIVeqi3yTyOogN2loVW3rRZs5/xgh?=
 =?us-ascii?Q?Ao36DExQzMixXxGBA6OsSAw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ywQnSC5X20cha48L/mlY7ueCAz5xiU5tUXTyx+4l8kIQPZsNRZ90+nzbL/E8?=
 =?us-ascii?Q?e2ymZF07txx6kujYbqDZzdIIbnaTPVglR98nQT92cvYUWkWCBl0rGqC65+XQ?=
 =?us-ascii?Q?NH9HBvsWoC9soTzs3HZfSA/j1lE2iAHCxFCvRxHEKRp+tzKWAqTx6YGIHVAH?=
 =?us-ascii?Q?xOd2TmHSXi9srNXGx8+qfRr+H6SQoIHKPqyaBCTC28gbdyO+ETmMis2VxeU4?=
 =?us-ascii?Q?tGG4MvSqLZG7vN5n0tazkQLyBtG4+Jg/ov5Cuouq76WcEKN1DU7Ub8gTZz9e?=
 =?us-ascii?Q?G3nLLPBAfQhpeuFaE9yfgPgrSmkb8eMQpR/aozaUy0YAVfX/6rL9BWTWhmWy?=
 =?us-ascii?Q?4q1VpF1ZcENUxGYq2ZWW2M9IE28T9w/hGL6z3l66riT1sdywYhRFzqshjVjK?=
 =?us-ascii?Q?h281uxB9EQB20C5EDmR2p+fqE/F8GQhzUKgmzx5yBbpR0FTPbl4nCVjIJhTE?=
 =?us-ascii?Q?uQUlSEizsPiT3uFizJ1OI4IK87ng7N67tLKJiwPp6Ro2co6mMpTgaQIl26lS?=
 =?us-ascii?Q?SbwdUtgLX8jk9pl5H02fGLfs/Z/T7MxB4JfWMTSdoL3gbx3xCM+ohujpALNg?=
 =?us-ascii?Q?tlf8wfX4+xqm/NkX6njCZD0wA1ONka0WSGKi1437xWgg43YVC+K57yjLPX9w?=
 =?us-ascii?Q?Xg1cxTn8L6hXfaoSo4AmBiggM+i8r30dLKfs0IuM2zXKS4rwmcjRvz8yPWWl?=
 =?us-ascii?Q?hlETn6Go1ulJuVUJmFAZ+KMoESAamfM5gut2t8V3awERNg8RcuWETnRV4Fle?=
 =?us-ascii?Q?CN4XcfT+MNEvOjR3qo9zzK+7AT7KUJovQVSIazz0eTGsXXXKhqu60oU9tr+S?=
 =?us-ascii?Q?b6CV+gd2gqHQldRq2iU2aPXQ/i5T5lnBdQ2PT6tejGvlYu+ZDATd5TdUYveU?=
 =?us-ascii?Q?yUMPYyglPCi9jaq6nLWEOwR7Y7CGOw4i520MiBXKB1dhjySZ35s4d8qpIi2y?=
 =?us-ascii?Q?PYhZ9y3Xld9680RJpEPHQ6P2TVVGKGaXpGv5Zg5NRSrrBk/DInZK6lF6iPF5?=
 =?us-ascii?Q?Kcv/6xU/eOv3FApiuoPS2VKj/6nkMGaau2H0liwGfbWziVo1kqGUD14xXbLE?=
 =?us-ascii?Q?EoBMIssnTeGqIV/O5InRoUBVaThlTBzWLOw0UCdUMjMRDB/F3SAXdrze7uDf?=
 =?us-ascii?Q?GrXApy7hIKfg2Q0smKoa3Raf2tLbrzGqpSctrGDTy9vFXjAa4llh9fG7rbt9?=
 =?us-ascii?Q?5ma1fSDWGFQenxlf+zQUKsBvvrisF90YKfWkSabeV/KnVCXY6scv7tmN9dbJ?=
 =?us-ascii?Q?EbU0wIIu4UXy13ZiQ84oLjPpdcqUhj8id6QntLxU8m9hh22nbp667MOE+UyW?=
 =?us-ascii?Q?Ls4eWFceYgsGxHkCaa8mGlsvqaTkav/ksFNOYfdQ5qT4VnwC2AmHv6EUWxZC?=
 =?us-ascii?Q?9+2/oPJghq4sVTiowJtH78w8UMwjxwrrLxZvW/vlcXzinPuHkSLU4ybxi86E?=
 =?us-ascii?Q?Yo1AF6yLQ1Z08sFrH2anQFWh82OzYqIP7lIWGf8SsxesGuol5/44P2kjvl2l?=
 =?us-ascii?Q?gqoOoHL8Jt9eeGPW2WD8lkjTI04oMBPAglr/ZTRBEBUHpr5pEgjE1Fq1Wif6?=
 =?us-ascii?Q?ULzQZ861YZbZ467JPYzoHWrEK1gTYHg6BBLt8pEZXnir8Rdk3Ivo6c42aJIs?=
 =?us-ascii?Q?ui1KX/neMPQVNuzORc1X2lSrEijeBZMb7yro12I2MD7NYFcFgAFFanu5RZ7l?=
 =?us-ascii?Q?cwnq7VMQuT8Q77TU/VCMNYy/8p2ck9PV4yJlOBWcGn/CuX1O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cb3489-0236-4f24-f1ba-08de679ac638
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 05:19:18.1387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xYpBM1JQPWaZYxtDu+9FiMQLFOujQs0g/GLEzpobhNXyVeJiH5l62OZAXvVOLPNBHGw3hcxVDq1GhCGEcRS/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Wednesday, February 4, 2026 2:09 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/kms_plane: Skip cursor plane for source =
clamping
>=20
> Avoid running source clamping tests on cursor plane, which do not support
> clamping.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/kms_plane.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index 2be10f032..a7b1b=
f25d
> 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1090,12 +1090,6 @@ static void test_format_plane(data_t *data, enum
> pipe pipe,
>  	bool result =3D true;
>  	bool found =3D false;
>=20
> -	/*
> -	 * No clamping test for cursor plane
> -	 */
> -	if (data->crop !=3D 0 && plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> -		igt_skip("Clamping is invalid for the cursor plane.\n");
> -
>  	for (int i =3D 0; i < plane->format_mod_count; i++) {
>  		if (data->mod =3D=3D plane->modifiers[i]) {
>  			found =3D true;
> @@ -1288,6 +1282,9 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>  	for_each_plane_on_pipe(&data->display, pipe, plane) {
>  		if (skip_plane(data, plane))
>  			continue;

Add a short comment explaining intent:=20
/* Cursor planes do not support cropping, Skip generating subtest*/=20

> +		if (data->crop !=3D 0 && plane->type =3D=3D
> DRM_PLANE_TYPE_CURSOR)
> +			continue;
> +
>  		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe),
> plane->index)
>  			test_format_plane(data, pipe, output, plane,
> &primary_fb);
>  	}
> --
> 2.34.1

