Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4B5FC6182
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 22:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1728F10EDCC;
	Fri, 13 Sep 2024 22:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QouH8Rc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38CD10EDCC
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 22:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726267676; x=1757803676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Vafsxv01z6NLS/xolpUFb0VnTrfw5zaSEEFuD2+5afk=;
 b=QouH8Rc33ehumb8RNt93WTLT07MT+dK0unI/cl6VBQowVOT3iT/NgOp4
 CdCfG7I29DqZLQ4c13A+0W+uu0FndDzB+DaCgBsL60gZPGJ3p3BHUIgVL
 Er9mPg9E+AN2Q6nf3Ve+T+HgB7NofYe1Itp0ZNhVWyPynIgYxT2uIFSnC
 O6N6k5l+qglSiBqa8xQrdDfzXGeBwOgChkLbwGvpdqPAnqHyc8WeuhcHc
 tXf3U6Q2R/TmBx9Sj5zdIz07uzqgf3AUDej/RaVPH/CpPHDvVd4IVi4pu
 TEmY/oRFPmXCFF38nxivdtpYm59g7ZK9VLhR4o5x5vZyUz6aqbq+D4rfi w==;
X-CSE-ConnectionGUID: 3tsfF/SiRFyIk9ea/Bamjg==
X-CSE-MsgGUID: 0cqDjNLqSWyDcGFJf0UQgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25382684"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="25382684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 15:47:56 -0700
X-CSE-ConnectionGUID: b4emSzK0TzqaJHAqZ/cQEA==
X-CSE-MsgGUID: UjTA9JqKQby4npr1FdogiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="73044451"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 15:47:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 15:47:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 15:47:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 15:47:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 15:47:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ms4XH4ELhkvVteaBejn+bxryRfUEYOmICv1KxV4N3ByP7OWWYrufLYOS++FwEsl5s3Ra7k0h8ThsIy4NgEVHSZsWUqgAnzuLWSJTrPnAKpnj9buj1WaphZwf0Kx749+EfkcxlQevOLLs8ssqKelYrlTo1+1eXLd+lGSYRCw0yMrX6ZSUBq4siDSKei9eCjN0LGNN1s+68AjPHyVF1aZDcbSOYy5JqoPnJC5WMqe+Gyf4XjvGIyn/sY0v/ewZnwTGhgtcK9XQMPym0tTtgNWa9HcqLbFWQc1WSO3UXXWeWBoMrVE1hLu8lZ3tWn1e2OCxzzMlut/oq3nkxYoTjd6BOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu2BrWAKDgMNVZhLwSbg1skPfOm1j11HsfuOk9bWfKc=;
 b=qLBo9DW62TpOGUb1JurWEzqw7no1R7Vsbcfqq+6f9EYpXnQwFz827jloN0c9jOHFkiShx6/kohloSJodRfmnq8W/FtUnT+v7l0vuL7MbKX1htsXSkTBM+h0PKcjirYpKV0h+fu7hyKNiI8mXF/BslZ2nOcaPcusxZ/9+0LqsiMWNqwZK7dRUOiLog1h8uncm0Dy9K7ViEMGi5WBcLV7MrExMv1DIxg0KyMoieWsUsnccgMB6cyh7EPSHHpdMMd/HhPAxKeGEqXIPT9EX90JpoxoMKQ3EPyMCnxjzyewFJsBXr4a5QkomhrCvWYW1dLbB8p7PJ18pSWF7LPQjkuGNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 22:47:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 22:47:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] lib/igt_kmod: Rewrite xe unload logic
Thread-Topic: [PATCH i-g-t] lib/igt_kmod: Rewrite xe unload logic
Thread-Index: AQHbBiqJPCWdMvDFsEekwDBZ8zGlELJWTcIw
Date: Fri, 13 Sep 2024 22:47:47 +0000
Message-ID: <CH0PR11MB5444D08AEF41B953365B6011E5652@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240913221555.569699-1-lucas.demarchi@intel.com>
In-Reply-To: <20240913221555.569699-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4524:EE_
x-ms-office365-filtering-correlation-id: c9ffa04c-002b-4760-d6d7-08dcd4461708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rqVp87+9hW1De0af7KoQs2b7ODkCDBqdmPFcvmtjTlxZnRQRXpPmObFrkLDy?=
 =?us-ascii?Q?SRm9JOAgmkT7aEifURXMV2u5yXFD41fyg/NVCpr8vXjkh3rnj5ZqjHw3y3/Y?=
 =?us-ascii?Q?6AEp9RmqJg0ib2Su2QwCv+2TEdr28uZEXTVgXQvwckeUuCNxWXvCmG1znCIl?=
 =?us-ascii?Q?uLTi0msSZJbwcuFXKj//J8ZxGg+ja5nomzvWweLy4WECa+mK+gUJP5nJrKCA?=
 =?us-ascii?Q?o1skadyGe+DJMtuKIPuxDVv0DGLsgiG0mCa8JKb9y4ccDOJjaO+vI2uQqEYX?=
 =?us-ascii?Q?qttc/NPx7geFZRFVFWc4Wmh1zDJ8yMNcK1qzm61Twq2/wBvTslfl9Vw+gUKA?=
 =?us-ascii?Q?aqqqcXzZ5SiMRZNxl6qxXGGJKBVKoInpprSeHCDFl/G8n0oi+TwvS/dXa+6B?=
 =?us-ascii?Q?0BWWqQwtI9kJKC4zeUJ5NZDK6VEewKxe39zwnhzv05f2SPJ+a3d1Laf/re+S?=
 =?us-ascii?Q?LYeKeYCv9nRpQF28l6rYc1YcrZGvUgqLSwa2eAJSpuaXk1POoafJGjuxqFvm?=
 =?us-ascii?Q?aVh6dGv/nbDdIL+sPwMAqb63uE3VQAiIEXKZgJ2fFGnt/R+xZ6HA7A9/vpDc?=
 =?us-ascii?Q?MHAOFS8O6zZOfkZj+C2QDPS6sUoZjB8GbKP2x6Sxq5C2sCR2wgxz4g3iErAJ?=
 =?us-ascii?Q?2MhHpQRIM96mC0E986nOLgNSufX+n58yAbaKAwwqFveHnsVWcWDJocoGakWz?=
 =?us-ascii?Q?DaElFrx+bt1MeM5kJqg2a0QE8r/hjhfq9VhEl7bZVZWh64n1pqDp8alZrkKy?=
 =?us-ascii?Q?fICiwxZ3CQfnfjfD5KlrOpoZioSMziIyAMnJ52pHAbyqdM+bNeiK8DmWYH6n?=
 =?us-ascii?Q?ALynkOrn6qivFad3CXT2zzaM4ATdjb0s84Uk/rxrEWFdEabdI5Beq3EstG+y?=
 =?us-ascii?Q?7+20OYQgIGbe8g4umNmkt7DziJ0pkGmVg3wSMzGmHnsNqGty+QHJsbrF8UzK?=
 =?us-ascii?Q?HsNhEblJjZXE99Y4BWmHEUKzMZaC1zsXc2/LxlM0XR1Ky03Is9eZA2jz5PBj?=
 =?us-ascii?Q?pmCv4YQQplt329CiSJ6EDTVs1qneASm+fbi6KkYM54whzxFy8URFiIOBIPhs?=
 =?us-ascii?Q?/FuB5HW9j9CEPF2KeREBdJ25P09cHhk0daOQm34TshoFdy5MxsY8y7jz2anf?=
 =?us-ascii?Q?3/cXWHF1a3ss9bX8nkw/BTM297F23RpjvtvpFh9uz0ZNgHshO7LFD1rD5jUL?=
 =?us-ascii?Q?SHq0Z7lM1+2UD7gqwi22f4NSql9OEj90FgNcKn6npjj0ZcsyZlsVjVE6zmNL?=
 =?us-ascii?Q?8fsv4IqLsJ/53BWoPS99yPCArI97gVaEMsMROzF0L4+59S4H1/iR7aYWu6ga?=
 =?us-ascii?Q?4wus/KahBxq2QTrvYFdcOIOTqhOEcV7s33jnUvZD5XibpCvSaMs0IaFzO5Xv?=
 =?us-ascii?Q?LkaW1JA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FJWCFXtMfFHifQBz3wKSwvFVG59Ot1Vt0/T/LDnmN5z7ljsKU0YsWGJMrZGa?=
 =?us-ascii?Q?roZ7QN/SaAst9hROE0cGtqmwE2e2SRSkq/kd6PvCw7u1hhSlRhis4shQfG2S?=
 =?us-ascii?Q?1ZUUFJ0PVPkhKh9loSSWw6k1+MAXplZb6YO8z5TS1SLqvJci16bpSUEY7htu?=
 =?us-ascii?Q?mN9DIUSyK+3miRibcdo/cvuZCyy9ePqkYqNTDVW2QGLNdzi4yusjH83rE/zp?=
 =?us-ascii?Q?dA8lTf/VLzEmGvTChChxUXMdQdWP+i+ZR/bZgfkGztDmfKIkzj4WaS9Zx+X8?=
 =?us-ascii?Q?PpcF/fZZWqDQEMmMS3hchSd7TZbUDnOjywUReoE0biEwG8uV5VPJCKfJF9wu?=
 =?us-ascii?Q?+/sX3akaZYqQ49ZWw/K7a3QGA2WJsxRD3tbRJYQN63rjS+9k86IuaYq1Y+NJ?=
 =?us-ascii?Q?RLepk02XitXOywesteQ6dNtgdcIR/tBoLrKVlpM+JeJIWICRxJjk+1c+MrLW?=
 =?us-ascii?Q?mQu/ukvUP/P3u/vH8mNibHNKiESKPvJl4YUjx8+jiSwGvEg7VJWyltPYosic?=
 =?us-ascii?Q?8BeNM2PRHU/UrQkn2Yoovi2FszoJRuHGaMGQQGmR4Bhn38rkF7YhC++aiQKe?=
 =?us-ascii?Q?TcaB+XuHhNqwsXEe7Z6gp6iZ15FazXxQUGYbHfQR8H9HILHXv4PD+VCqqpZ8?=
 =?us-ascii?Q?Xy4ZN+/ETqYldJizsIDUV4nVZiw+TTRAFa3BzZNMx7OR73/2urcepebzwpWG?=
 =?us-ascii?Q?iBbxw6PR5ubm+CZb8gQmHPs96a1aJ1dATQlTkocyYdjjU7I2ThKXk+RR90+P?=
 =?us-ascii?Q?dbLtJyfiQyg5qSJ8isfkRURajf4d0irRi0+b/lLXaKrWHTlfI95tpmb/njIc?=
 =?us-ascii?Q?P41PlnU4yNZKe44xkXoOGN9HLOgxrTLkfzk6+YEn/BbvOeUoMpntxWSKbHnP?=
 =?us-ascii?Q?wX9raf3BYn2UTehrjS8lC7Al5W0b++dV3mLupB+lpc/ChMrKcEp436DwwXyq?=
 =?us-ascii?Q?WFZ848duFw0hecKFZs/n73HhMs5w565oOFXldjpNukRpQ6nVbDW5PzS4pd0R?=
 =?us-ascii?Q?j0ozoQer8kq0/rhmQmNtAEfledKINZky2nVLG99Bw4wf6BhZ2fWChYbfR2J8?=
 =?us-ascii?Q?lBW23fGWtyXnTiLW76CZv9IOC9nEmTd6c1Tw1RPyhcnj7N5rxScXLgUxas15?=
 =?us-ascii?Q?Oh73WpM/tIANEgNvGKCeC0iWgU4WFTEgkcayL2VryvEkRyiJCDOwFCUGOq94?=
 =?us-ascii?Q?HT3mgWGuPeird13jB2iYPkU1NU1hegU7dRlBjveqtEfk913yAH6u1mviIiJu?=
 =?us-ascii?Q?yJGL40rI/3dCjUCwtz7FznQnatc6OAqhw0MjPuqdt3dAQqnFNZ0GookIpbbI?=
 =?us-ascii?Q?mhS0aYK5VGtK/pRSp2rWjkXLd0Bv+hkutySLsJpFIp2bFeuTNOrOAswZtWW4?=
 =?us-ascii?Q?1TMl/f5qJJ00tvcK6ebMvMyl+DKeTIpf+p1eoZpv8/WjVdAQU+2s+kFvQyn6?=
 =?us-ascii?Q?BqSVOPXKrnNunVtbzjtfJnCnd5CKTSd8e9DP0caRPIlXQR3gsNj8H+PRh4vf?=
 =?us-ascii?Q?vfGhXx0IwseQcSCJAL1QwUeCumZJAXpwUD4N2W0pQSkJbPRlmHsccezQcdMW?=
 =?us-ascii?Q?v6DjanLlujtxhIHwiTBNxvGmCXA+THYIVZg2DUF4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ffa04c-002b-4760-d6d7-08dcd4461708
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 22:47:47.8887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGBBIY60QXCWCW9qAcPHrHdXxNIrHgg9fs2a7fRzNkFmr1Lj/fTuYRnkqTPpquuOgXYvepHIgL2lB8SjsSpwJiCQo66nRzlhuPt7YdnJG/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Friday, September 13, 2024 3:14 PM
To: igt-dev@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Bommu, Krishnaiah <krishnaiah.b=
ommu@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>;=
 De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Rewrite xe unload logic
>=20
> Stop trying to unload possibly-dependent modules. Loading a module and
> probing a module are 2 different things, although the Linux kernel will
> by default probe devices when a module is loaded (for pci, configurable
> in /sys/bus/pci/drivers_autoprobe).
>=20
> For the unloading part we can simplify: instead of trying to unload
> the modules directly (which may complain that module is already in use)
> we just unplug the HW first.  For each possible device bound.
>=20
> This will be come part of libkmod in future, but we don't need to wait:

s/be come/become

> we can implement it in igt too as it's straightforward.
>=20
> For now this only switches the unload path for xe, but if it works well,
> we can switch others in future too.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2362
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Some minor nits below, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>=20
> This works for me for the test above that was failing, but not thouroughl=
y
> tested with the rest of the tests that may trigger module load/unload.
> Tested on BMG and DG2. YMMV :)
>=20
>  lib/igt_kmod.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kmod.h |  5 +----
>  2 files changed, 48 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 464c0dcf4..1868fdbf7 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -697,6 +697,53 @@ igt_intel_driver_unload(const char *driver)
>  	return 0;
>  }
> =20
> +static int unbind_xe(void)

Nit: It might be better to rename this function to something like xe_unbind
or xe_unbind_helper instead.

> +{
> +	struct dirent *de;
> +	DIR *dir;
> +
> +	dir =3D opendir("/sys/module/xe/drivers/pci:xe/");
> +
> +	/* Module may be loaded, but without any device bound */
> +	if (!dir)
> +		return 0;
> +
> +	while ((de =3D readdir(dir))) {
> +		int devfd;
> +		bool ret;
> +
> +		if (de->d_type !=3D DT_LNK || !isdigit(de->d_name[0]))
> +			continue;
> +
> +		devfd =3D openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
> +		igt_assert(devfd >=3D 0);
> +
> +		ret =3D igt_sysfs_set(devfd, "power/control", "auto");
> +		igt_assert(ret);
> +
> +		ret =3D igt_sysfs_set(devfd, "driver/unbind", de->d_name);
> +		igt_assert(ret);
> +
> +		close(devfd);
> +		errno =3D 0;
> +	}
> +
> +	igt_assert_eq(errno, 0);
> +
> +        return 0;
> +}
> +
> +int igt_xe_driver_unload(void)
> +{
> +	unbind_xe();
> +
> +	igt_kmod_unload("xe");
> +	if (igt_kmod_is_loaded("xe"))
> +		return IGT_EXIT_FAILURE;

Nit: This is a pretty significant departure from the current implementation
that uses igt_intel_driver_unload.  Specifically, it seems to carry a lot l=
ess
"baggage", which I think is a good thing.  But we should also be careful
nothing important went missing from the old implementation, just in case.
-Jonathan Cavitt

> +
> +	return IGT_EXIT_SUCCESS;
> +}
> +
>  /**
>   * igt_amdgpu_driver_load:
>   * @opts: options to pass to amdgpu driver
> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
> index efb46da12..ee1719a8f 100644
> --- a/lib/igt_kmod.h
> +++ b/lib/igt_kmod.h
> @@ -63,10 +63,7 @@ static inline int igt_xe_driver_load(const char *opts)
>  }
> =20
> =20
> -static inline int igt_xe_driver_unload(void)
> -{
> -	return igt_intel_driver_unload("xe");
> -}
> +int igt_xe_driver_unload(void);
> =20
>  int igt_amdgpu_driver_load(const char *opts);
>  int igt_amdgpu_driver_unload(void);
> --=20
> 2.43.0
>=20
>=20
