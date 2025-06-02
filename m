Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90117C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 19:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7810E580;
	Mon,  2 Jun 2025 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aara1u7D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373B10E57A
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748891028; x=1780427028;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=9y/lNqzl0IvxgBdlNz4/yI/K5gWOw+shpbkzaXvQ0q0=;
 b=Aara1u7DDAiYa4iWwmsGYAjgsNNg4IG0C7t1CMLjE+sQauQKCj4DnZkU
 yMJwSQK3ejqW9qMG91OPRDCYOyl4g/dvbrsPK6DcgEFUjsJrn1IMMuoj1
 Hg71r8YwNRAmOnF1z1h+1XZp5sLmPE1cY9i6hGA3K5KquiTv7P0pKSFPI
 i1qQQBmWb1X2wrzstOemeDF6UMhgFBKg9vxx2iNzrdaX8owYuRfIewi8+
 h23lRwzAu8poymOX0cg6SSFvw8+r/8zYDJ0AvsGayrA1Szynb+yrC5Pru
 VdoD7pakED/vvfznHMoyF+ft0LjNQW9XMTvk65uG/5zi7r5hOyRnQTPXS A==;
X-CSE-ConnectionGUID: ixOrYqjbQ1OWh9gCjHedtw==
X-CSE-MsgGUID: VrjTTnU6RpOg3e7AEEU8Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50827058"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208,217";a="50827058"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:03:42 -0700
X-CSE-ConnectionGUID: Xoow6aruTT2OLTa46hsa9A==
X-CSE-MsgGUID: VeSmqS4PRYCA0t0KKYyIbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
 d="scan'208,217";a="149893945"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 12:03:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 12:03:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 12:03:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.48)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 12:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbRv3i5CDmFiJQeZazV0nwU1dVr0ATp71Q2IatE/ixWWo3ujA3BNe4HTJyL28qMeLdgwQ/0hwMMGxUNerDHw+nJ5f25o/tKZStxBpirlxfooYy2NNEj0A4tDQbpOFUb0iYxuzVitzrcTKp/tWqqs6GgiKQyLRAHhHmXD0aT6urWwHcq8ah7ycYDh8hL1Yg1tqEIHIc3insX6yBP4PeNGpaNPGVGGFUX99oK6hAefcwHQrD7R8Wo38nTzGcN4MTesDI3qoZKYovkS1w7m8/F86wAfjYSIMJDqeS/+/nNA+FO+Vb7Hmy0yZTvAsapUEA1SBI60vXRclSN7wzMQEdeP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y/lNqzl0IvxgBdlNz4/yI/K5gWOw+shpbkzaXvQ0q0=;
 b=P0l7/2wYtP9ysPKx/P0toWvGR+8zpwvngOVwpc/fMf94Z39MIKSnh3dgYFlndfYAGALIbaJBw7/rfWLq4tQbhF5buLYqmYcldtXR13YVwJCFqeP0tUttgiECl+XtdWrosRekmWh1GEVpFYdVvjGIWBRLphhKZqvjQfTo5hz730Nl4+rjs3AdH6JZZFnvl4NUMfufP7Tu3NKGyIssYJ+fsqs/iSlWIXX+J6wdaLYxtbEZXVrheT85ILNE5beFomdEJyI7tXGif0GrbNTInhJ1/5kSA+Y02Stl9LmlMf31JfySKutt5+kKat2Ikd+S9heZ8uQ1vTs1Cly5Ur6UZRp30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by PH8PR11MB7990.namprd11.prod.outlook.com (2603:10b6:510:259::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 19:03:10 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%3]) with mapi id 15.20.8769.029; Mon, 2 Jun 2025
 19:03:10 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "markyacoub@google.com" <markyacoub@google.com>, 
 "seanpaul@google.com" <seanpaul@google.com>, "Santa, Carlos"
 <carlos.santa@intel.com>, "Singh, Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH i-g-t v11 1/7] Add stub for procps and glib
Thread-Topic: [PATCH i-g-t v11 1/7] Add stub for procps and glib
Thread-Index: AQHb0L0E/xY8oDvh9ESC0pWK9YdS8bPrfc4AgATARtY=
Date: Mon, 2 Jun 2025 19:03:10 +0000
Message-ID: <IA0PR11MB73535C2B916B2E7A07EB905AED62A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-2-jeevaka.badrappan@intel.com>
 <20250530182120.fm2ph2wp7hyai43e@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250530182120.fm2ph2wp7hyai43e@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|PH8PR11MB7990:EE_
x-ms-office365-filtering-correlation-id: d48d0382-1703-4832-bdca-08dda2081dff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?J7IkC/GB6OP6m7JZE6kNefGBnJrNuwAnmdIQVIlLxISYZt+7KFe1Gjr8WC?=
 =?iso-8859-1?Q?CRhw4hYRdP97dz6ZLFAIiSvHZGz6yyC5iT422TiNBm0fVf7xAEPtQ9fbVf?=
 =?iso-8859-1?Q?EAKaA0ia64PKtKvCCFpLxVlX9O/zuH40fb/WXi3UXcv5gQiA8PrOhdBEgz?=
 =?iso-8859-1?Q?uDZAkW+NMZ0a6th1QealAV0kULFgSKQk25PJPxJ4fgLXKYTm8hTF8PNQXJ?=
 =?iso-8859-1?Q?SYAsBjhPGNobvEU8xiiL+j1PuAI6Njoby7EXb3brhcXzHwCK4OofVXEnv7?=
 =?iso-8859-1?Q?JSgZyFHzkScUHcx0rqlb6Qp1KQaKQxhyQvsPz61KSh/6/VHafNqOauovCt?=
 =?iso-8859-1?Q?l36S4ANMKsPdILPV6WklJoxm9yEMcGB7HZ7gEDu07Y8jIYOnyNdrRQEAVQ?=
 =?iso-8859-1?Q?6Crn6eBRBnGBTNOwdZMCCLG7XoL3uGQi/7UbOhts8tvbbPmaAB+/a8gcrU?=
 =?iso-8859-1?Q?Wyq9RGR4s627EfeTxspneYx290KwtGRZqHndOxge72L2kP58iyjxBxZlZK?=
 =?iso-8859-1?Q?/625LUeASgBYVtCaJV6EJfjA5JwOqb2e1FKsYka9owDXq7A0JX3WS6A5UR?=
 =?iso-8859-1?Q?Nx6WkzzccDvq9b/0gcpohYtXoyfOZlHs1vpGau7RLdmbKt78UYKqav34Tf?=
 =?iso-8859-1?Q?RIyTO1C37EUvUJphT+1/Wy2aW1FBtJG65T1A/SU3pFJHx6Tvi978DqhE3f?=
 =?iso-8859-1?Q?zNKP8JtYGDqVWf4DMJt72YrUFe4+NpUhAl67iBoOVPO0I9Oy1BCqlPuc3s?=
 =?iso-8859-1?Q?9153MwM6v1VlSlVYrQAzDm3bsjtnmbfhOTDI20MF959nrY7X6jEEQxE15D?=
 =?iso-8859-1?Q?fCJ/46/kc0nZ/NXL/BChevHXiMkQOTyDkUN+F/nTH0TxQa5i9Z7Fy+zVzt?=
 =?iso-8859-1?Q?x48JK4u1HZoWDcwZvnvnIhAl9/pPUl454UKKAN6bNgnTUCXFoEtWtcFaYX?=
 =?iso-8859-1?Q?weP319bPGFN+MkR+rySJUmz5LbJtxkA8lNg16dlAPuwM5U5ES8xaPSYIqv?=
 =?iso-8859-1?Q?3tEUcu3Rv7TsJdlWUSpO89SB5iwJejVOnz13I/cxeaV4/VaNgShYwptlzU?=
 =?iso-8859-1?Q?tQt0WfpTHCYsZovwXgHLrDSueQT99ASRmFPu9KWY1k9hJjphlPr70BGZQ/?=
 =?iso-8859-1?Q?TkVhN7eiN6JSi7RRdEk4TbhO3iIwdOJU9Q/fH5pG2diwuBozjc3a/j014Z?=
 =?iso-8859-1?Q?+KpVhU7B/p0xTm4Bx25op7X0j8Jb6e3/6KebRWt8Lqrx+BHygGE1Rvd5LJ?=
 =?iso-8859-1?Q?thaxbTGXgMzOs1h5ML558wg1dGJnu1PBilLF3q77mq1vkqI9p75B4lISpJ?=
 =?iso-8859-1?Q?WT11AnQT4FS3JJPPji18jtcbmHIgUIXL25AGXN+6TMLC0S+jfvgIa+ujeO?=
 =?iso-8859-1?Q?/HYECdHaGmgR83TMZ29uFHxkqiT3oJwJh5cJsIAgsxjGTlSPiRMEgKWKRN?=
 =?iso-8859-1?Q?CuW3CMzg2V4rFt52riThG0s901su75A47sXgn3HfVrvy5w2TzEqSuANJz1?=
 =?iso-8859-1?Q?snw+ngfHjLTzbK9NB78MCbuNdbYY4fo/5/ug9n0YudNVwhcKqGDkGkltbo?=
 =?iso-8859-1?Q?82Jd0S8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Kd9nwQlb6nV6PkqU17C8pzg1dPBO9OGQ/OwihJ5BUDGkoJkBxBegBwZmEe?=
 =?iso-8859-1?Q?SlgtdZQsH7ZEsXot4Yek4luZKgAs/tc8Dchzf/8lXNBicKKCQwCA0lLsiH?=
 =?iso-8859-1?Q?A+rneG51MmnOenk+d7Ef3mUYHrF85nePlVvn/JPqxmeZMHlrHqvKiPgPj7?=
 =?iso-8859-1?Q?h31nYRpHQmSZbSrJjsQD/XLt8/yaL94aG/B++xtcUufOIw7E/z1rsAThAV?=
 =?iso-8859-1?Q?aXW2EXCrP3rr1zKm4nKyR6bXM1b4wW7iww0X1WX9yS3/8Y8YJw4/4ny2Ne?=
 =?iso-8859-1?Q?9U0IzIzBfqfFtHnWAUvC2KA9jVznbzu59XSYIitBt+ddbYXvRuBzHQU+Qt?=
 =?iso-8859-1?Q?QQd37SgIhvxDnm2Ab4aAnmZBFwMHl2L5bXBSLdBzGVo6KDVW9gWUrcF4mk?=
 =?iso-8859-1?Q?gwGpeAFvTbLgn/ToFum865bU85C4mECzBHJzCfyhw8ighSELSmXIaKFz8Y?=
 =?iso-8859-1?Q?rkNjfyduZaxlGkVx3hq/d1L3draDQy2TAoMapglpYigdMCAtYLZjUF1aV8?=
 =?iso-8859-1?Q?63oVxtO5z1mVaLSZirWe1VAaqwXR0SmLx7/kPrLpfptHUofOgKxPUKId4w?=
 =?iso-8859-1?Q?GhHXSDrOABOKi1mBhw7fFTPWO9o6DxcK57Hw+97YaVdxCAHMxUJuF6OxCW?=
 =?iso-8859-1?Q?9EejVgFS6sjsRqxqKo6X7aV50zYDnQj4L2VOvH18gPQ9p/NiOjt/9GMctX?=
 =?iso-8859-1?Q?5YilxBFn8xCbVaEFGLFad1inY/Vq0aQd/KPQzIUZgzWYH8kWPN0ux7VQsB?=
 =?iso-8859-1?Q?BtWpLF6hbfJ7T9wqqXTqmU/cs7oR8VqQEpTzTTjz9azT9nDV8grn5a4Cqm?=
 =?iso-8859-1?Q?ZmrABWAJcyGuuVHHJhaBYiT0yLsMB6PnRyCudxVOtwRrKSCi6L4JYUUzLK?=
 =?iso-8859-1?Q?PasJ13xdJolS6/zzoPl6rH1qHSv8SnwBSdep4rizcJOaMDgkxUsiPmPYlL?=
 =?iso-8859-1?Q?0tsLZcdbFDYKHPZqldGo1ZJDS2pJl4pVcUJyf24cxo3sFiQlTuk8DEB/Ez?=
 =?iso-8859-1?Q?v3EqVuISb4ff33Dtzw62SKLcKmNUM4JDCsVlwc6xOQF98fFZRcg5MQMKkH?=
 =?iso-8859-1?Q?ZYt2nqBmcxMRBqsoFciK0uyNYsJuwP8rNeVvPlu7gcE9c0K3w532yf+t4O?=
 =?iso-8859-1?Q?rqo+IwrCHSbwB8qLkQArj74A5CMpcrL20LeBCltLgMN6Um1ha5tAaja/Dg?=
 =?iso-8859-1?Q?wD+1o5ut+qqerjXg78CGCU36q0LvFLBZKJQykFVSfLkYVzAztykGVgvxKC?=
 =?iso-8859-1?Q?CQJiZ8mVSyWezcp2WExTc5QgqtwXrvoiDqoNfEz1isNHHlvUAYTIOk0wgB?=
 =?iso-8859-1?Q?eoZzjIHYLoZZ6G/rzA3aPTVt+Y380J/E/FMiD7fmMNps0TdEqfpe+vXts2?=
 =?iso-8859-1?Q?TEIl8ijOYvmBHTA2XrQxlLd37tjMhQR+374DXJWW6IYeOkkUBSLDvTkKvF?=
 =?iso-8859-1?Q?PrbQIjZMqYN7I6f453vQX50+rw0avmjcUtqufGOYxeEkSweqq8uiFg5FX1?=
 =?iso-8859-1?Q?ommx29PV2Se/3RvQHVApY4xVzIpVDcy6BI8h+HeCg3eGWGcR1SOkDM5nrU?=
 =?iso-8859-1?Q?Uoj3Zv5gs0YJexNuJkrqCZVuh1VENNS9ct4s7twn0LpuxP1stnY1ZzEzlN?=
 =?iso-8859-1?Q?XDWFprDQBbX8Spfhiy8t0KyIQ/KILkAsES?=
Content-Type: multipart/alternative;
 boundary="_000_IA0PR11MB73535C2B916B2E7A07EB905AED62AIA0PR11MB7353namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48d0382-1703-4832-bdca-08dda2081dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 19:03:10.2882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k2n1ZjaWMGK9yvjNRJ/cWC9k7tHBZCuAca1asqlznaJb44dIuQFjp/YiZOLEED1kw8qwHZhWUKiMB9ksOWW23Wbg5oDigL0vHmqmdMBh2rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7990
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

--_000_IA0PR11MB73535C2B916B2E7A07EB905AED62AIA0PR11MB7353namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

> +static inline void g_clear_error(GError **error) { }
> +static inline void g_error_free(GError *error) { }
> +static inline const char *g_get_home_dir(void) { return "/data/local/tmp=
/igt"; }

> I am not sure here, imho this should be some user related path
> or path where igt binaries are installed, if you are ok with
> this it could stay.

As igt is only used for testing(not part of final builds), it can be part o=
f igt config folder
like /data/vendor/igt or /vendor/etc but for now would like to continue wit=
h
/data/local/tmp/igt.

Regards,
Jeevaka

--_000_IA0PR11MB73535C2B916B2E7A07EB905AED62AIA0PR11MB7353namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Kamil,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
&gt; +static inline void g_clear_error(GError **error) { }<br>
&gt; +static inline void g_error_free(GError *error) { }<br>
&gt; +static inline const char *g_get_home_dir(void) { return &quot;/data/l=
ocal/tmp/igt&quot;; }<br>
<br>
&gt; I am not sure here, imho this should be some user related path<br>
&gt; or path where igt binaries are installed, if you are ok with<br>
&gt; this it could stay.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
As igt is only used for testing(not part of final builds), it can be part o=
f igt config folder</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
like /data/vendor/igt or /vendor/etc but for now would like to continue wit=
h</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
/data/local/tmp/igt.&nbsp;<br>
<br>
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Jeevaka<br>
</div>
<div id=3D"appendonsend"></div>
</body>
</html>

--_000_IA0PR11MB73535C2B916B2E7A07EB905AED62AIA0PR11MB7353namp_--
