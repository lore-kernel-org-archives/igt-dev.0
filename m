Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904CCE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 08:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AD510ED02;
	Thu, 12 Dec 2024 08:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLIvvJHE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E010ED02
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733993431; x=1765529431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hq8CcB24sNd3z+wb+3wsy2d4nrBQbmXxY/FHGk+Yhf0=;
 b=BLIvvJHEpjRiVEZPoPBmuzI33MrFzORf1zsISAL3Sby0wVpAbxJJUFeH
 IrcARLGcrCeX19tyYrlqP+EclJSx/om85phzbggU6NqWP2+h+RaYdsTG4
 fuDmwKMHFk86RX0BYll6pLAe6az3tRQ6Mtis/FTnLZ2nKOQpSZfS/Gq4n
 L1PtH0FqdZJqMueJ6EbiBmLZqM8BHTCyoR9jU5+XNLnORTGuvp+bx0Q/U
 Bsm58rrsY9SSV16ZO5Mh5a+YrFHJ2vOKfJYxI1AUrQOZIKZiS6+sLzFZL
 gDl15vCy+LBKAHMWz3it5/dQlYgTd4uGyhyKwcalDCYpqjQkUgwx9lwDA g==;
X-CSE-ConnectionGUID: wk7bCH2vQg69QkwfOk+hnw==
X-CSE-MsgGUID: yqsCIWfQQPqid+tpv6LsHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34274677"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34274677"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 00:50:31 -0800
X-CSE-ConnectionGUID: PaTZhFOOSSS/wR9XBfCpxQ==
X-CSE-MsgGUID: bm+R0z3FSGmpHy0w5xwXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="95919507"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 00:50:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 00:50:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 00:50:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 00:50:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl079fwB5BCzxLb52n5r28j1LvfXsAfkpVJeZrLJmBkMVfirCeQ/TjZC/vv04NpEXeRSjwifTYaoA5Jxe82X20mc2LWS5bbmtArlF07nGowSxNUNIpulKyqqu+ErOWLdwigXVgX52UmlTyrtYajcP0bJaaFuzgGQKjxlaWdnHCYHBupDsnWKrc/ZQB/DH10YnP1WubbLyaygDYJNNK1Kc4tJd4dcb/JidUaQRhXdRqENa9qejfRDCyYlc4UTPk3xpzHYyz35yTp2ZfPaIGKC/W+v2TS/Izx3tavVXSNbOTfz1ky7Pe5DNkbgxm2V00nWeUkaRRpS0wgtUx3ILdd0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KxRYBpSk8tU0OTT6jo2k4khJTqIJIfhOAO7KL2d/RU=;
 b=Gn4VboS6mgstBnOZE1KXj3Sil90AvT1bO2XtUcYSSj+e5H9wzTypQFDR7J5kveyatvTelpfGgs0aKzPPIeU9yqJ1WP6YAuY9wJH3sepz6tdF00pJMQpOeAefpqCHpQeiPvuNV6TzoOkYIZllk/dg4C6iNWaODL3tz4xDcrAXK3vjyFEeIFoTALREm3fbv+0MCT+GqIpmTvpID2IA0DNRuHZTNIlAqvbeedQOJB2p6Bdj5vUYosRCY2v3uS70ILAmWU5xSG+uh8QKzUOjQ3wZH5vTFp2DHAgs+ax52MlFGgkoNU++ulUEv/t7S3ek72YUJiIcYNpdrOLSH/akSxU5fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 08:50:27 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 08:50:27 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Subject: RE: [PATCH i-g-t 2/2] lib/xe_eudebug: Fix and update event filters
Thread-Topic: [PATCH i-g-t 2/2] lib/xe_eudebug: Fix and update event filters
Thread-Index: AQHbTAFsGV2Hriu0LUy6/vqPrnyHR7LiTbUQ
Date: Thu, 12 Dec 2024 08:50:27 +0000
Message-ID: <DS0PR11MB72641B7BACD8C45387E9DA62D93F2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241211191741.36973-1-christoph.manszewski@intel.com>
 <20241211191741.36973-2-christoph.manszewski@intel.com>
In-Reply-To: <20241211191741.36973-2-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|IA1PR11MB8197:EE_
x-ms-office365-filtering-correlation-id: 68c0ab8a-672a-47e1-7244-08dd1a8a0684
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?vKmmEUUOzsPSmzvgoZTzhlbWea3VigQOaZ3W8eqDfQHVjJjdm0J0HJW9LR?=
 =?iso-8859-2?Q?FXnQQgWqxmuMIr2FA8D3TGEPk6heg5mxxqJ9y3YldW83SeIxfXlsh4us/7?=
 =?iso-8859-2?Q?ycePgQEnFdAy+PfNXIF7SMuzy5HSOS/XFYVl9whN1BvC6Q/sZx7NTb/pwq?=
 =?iso-8859-2?Q?J6XQsVhXOk72yXis6lTYA5ogzMPHAcde+wNxOsDA0CIKbSbg43Ntkn2fDZ?=
 =?iso-8859-2?Q?HTxMMrX4LMAFAUn70gy/g/EGEwaVST7Sv0q3ENwltPMC0B8EjGsRUrD4kE?=
 =?iso-8859-2?Q?D1cX5JYSXfbgDPsYEJ62DtUR5PJAr1itJrzXDeRWplUYN6dUB87D3we/dh?=
 =?iso-8859-2?Q?CJ5DHbFxJiDhxN9mgu4a1k/h6W0XqOUCCxYXeJz/UD0Q0ucVBIsjUNDLMb?=
 =?iso-8859-2?Q?m+EALgzGAJmxMmAAVtbcygHBO6z/eaVr6pTL/A7R7DPDpVqWqJXd+9Qha2?=
 =?iso-8859-2?Q?Py+SOSmBjoppxnQ0xLxW7FlhoXSBN+klo0vgsvCyF/Fvndshq1b6pv4Nah?=
 =?iso-8859-2?Q?1Oe2tfmczIO6WRz6QiFQEz28MTb2W9arjGsEMBoNRjHDiEdGVq5L0+drI8?=
 =?iso-8859-2?Q?D/4vPMkaFCDgmf6+j4eVUBKtUrJEECYy7ZUAuyT3CyN4zJ67l/sKiBeJHl?=
 =?iso-8859-2?Q?wwnSgYeT9lyCq8HVzw+tVT5hpoM+Odm1gvmA2s8BEHeWMmt75jdy267Dli?=
 =?iso-8859-2?Q?1+a9jKa0W7u+Ufx9tyoHeu9fbOp1WQ5Nt0UCGSAbBL1lEvf+GFaaPHdFmT?=
 =?iso-8859-2?Q?lnpCYZsPq8eD7mOQa3ub9uLkrhBsVfTVlw3DjstSaSeTZ6yOm9KZ+LXl/g?=
 =?iso-8859-2?Q?Sq8Kt6jrhIeDYQdXo7eSbj/c4lkebSpJzFAnli45lGPyQ5ebqwoJu1PFvg?=
 =?iso-8859-2?Q?DYinZIdQB7IYX5Fg2Q24cuxSNKwS/hhFo/Y5nN3OixNZy5b+oXTAkYRDAk?=
 =?iso-8859-2?Q?ieNqOP/juSJCJwcvVJtcJdQgDbyahulG7Kzj7+q8jkAK/EJyCfTAyBYiQo?=
 =?iso-8859-2?Q?ljzDuALXW1MIFZO2cV38Nx0ri0x6luaEQMkbh56BnDx7RwQGMpywoWeTvI?=
 =?iso-8859-2?Q?O4Lr5KmPvICO2tofP0tmKBEg4QvFNGyj1XFHbwfgqLP3WmM3zGfbQFmkrd?=
 =?iso-8859-2?Q?aATO0SO9WyDM6ebojlBWryb9CV/zJK/GkkPTgfhK/DAfmX2ZMJOvMsU6lC?=
 =?iso-8859-2?Q?bG0L8MJivIjbauHboXseJIHk8o1OCIgM/A4CLKUF5X8+GFPq3pMf5x0tvk?=
 =?iso-8859-2?Q?Gk8bmVD+HekpyfS/0tgVm6ofyWJ81Y31mynGep+xw0BcMjc7OLhIbziplJ?=
 =?iso-8859-2?Q?A+X/yB7QircKfKgbEcgy25LAvFdvkDXVVrFkEcgHubJcO64wRZ3RG6Mj9G?=
 =?iso-8859-2?Q?vxlX1+YQ0CZJUhMr0GIsetYfmzJtMQC2EIQ+TinLO0KO32bTAZqHo81kID?=
 =?iso-8859-2?Q?cmgHlh98fe8IMFLpDIlaAHyZY1AIL4oeeIrAgA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?fla79XWFwgQUmWcE1aQCCl/qPfdj2hSsVDn+1kO2QGwryYM3RvjHev1/b3?=
 =?iso-8859-2?Q?vSHQtUf11Rj2E6Q9sx2lkdGUlHfyCw758SbKH8urr9ZP3wTcG4VWtnG505?=
 =?iso-8859-2?Q?B4BVgTM3q/Sj5p8jNOraIBeXmguB2Fj1vdCjL3bwIXHg0K3xvAjanlDAPT?=
 =?iso-8859-2?Q?6pYHy2h7EUPnicTLcCDPvWlaP5EaoU0+ExMwPiU3pUuYdL//JqG5AFT41w?=
 =?iso-8859-2?Q?bWO9yovjahJa0MMsgWfv+xClQDNn3PAgRBZkEhmiOK+HtX5SpS/Ky0Db7y?=
 =?iso-8859-2?Q?wYSQA26tv+N7jmp/FVjBMHf+Y1dcE2UGGdyamHktv8bqrbLMCMerl+q3hg?=
 =?iso-8859-2?Q?WvLshWl0aYHnfH1Dxk7QG8L6WGTO5ri9ve42olD3lPEaN1rzHbCXCQYX9E?=
 =?iso-8859-2?Q?AzvzQqKaEaGykT2a3y+O+4COMie20JPLOLnd6kirhEQ1RdlynqM+vacJx1?=
 =?iso-8859-2?Q?usmv3psssMrcVa4KQ3OyQhp0DcSnHnYMCyxYR3oeZbP+06dDTH5f3IdcC2?=
 =?iso-8859-2?Q?rE3pmTrdJidbBlhBd44cO0aauKokJGlEbpJkO2yLLhh8f0fJz9IMzbwW6E?=
 =?iso-8859-2?Q?Y55O0meEqwRRzeNT2RpDewPyXGH3+1O6tSC2/rTZhOpFQkbBKCSa0gbJR4?=
 =?iso-8859-2?Q?1g1fhIlFBCs9DCD4gjb8qdNc3knZg5RZiUcJN0EdiJc6e4FxQOEPq5BIEn?=
 =?iso-8859-2?Q?onhxsldL8gduP4vlK1RoI1QStjl9oH/8GxASnvANo4qF7xDlN/aURcE3+m?=
 =?iso-8859-2?Q?HFBhB3WMJ6XTYqtfZ3FPThbdgP+YG/iqkuN3htF9vkK0PWUusNL3bsbBBU?=
 =?iso-8859-2?Q?vU5Hfwk8IrjvVmldr6qdXCjRPF4nvqcub1JeSHxEvzCKs8h0Wrdy+Gz6kj?=
 =?iso-8859-2?Q?pRUpbz2JQZeQHmNtWwMC4nyqGM/pEsrjgTcxY5WxQL3qVP4SLUJoJlI9HO?=
 =?iso-8859-2?Q?cujrVk3kGItuJdvcZF66qk0Ll8X6Glpxb1UWXgyFkj9l3mSbKwPJkm0jcF?=
 =?iso-8859-2?Q?3YqfGgsxVcV/Z7vvHmFEYrqQQsdiEeUJip0QMwpzbslVBZlEfMB8hJ6jsQ?=
 =?iso-8859-2?Q?IWRRs5vytYS+H0Nt+E3SFVUYeAXl/bqMeiE3u/eg6Z46TjJfhLfF+4dE71?=
 =?iso-8859-2?Q?RHBJ3zOFY6BV8e9OX9m0IiYSshTE/D0kuabcKDSN9ggnGjCUGt3k87B2DC?=
 =?iso-8859-2?Q?xvLie6GvymHiZtNAFNn3NNcbbvP5U5EbpoFcWOsIlJ8Yq+mwhJnuAcAQqe?=
 =?iso-8859-2?Q?3nrAaNECh7hdiqyIYpkjYAEygMM2/KtGc7Ki1GvnByp9m0LTJCrz0PIy4g?=
 =?iso-8859-2?Q?X1C6nrPmvAP6/m5+HC6c1qIQvowTTYevsKCeNqnYEU9KfnXXqo4ZQ1AcFo?=
 =?iso-8859-2?Q?fDYq40siseqfGSMNcISWPrR2jChS0pnDxX2HCPeVJxkMV40YsgqENJovpE?=
 =?iso-8859-2?Q?ROE6Oz+2Nip4G/MpwL1kY6sbrCrHtPvCQmaZQaYxRurZKYQvyWEs7dbV0A?=
 =?iso-8859-2?Q?jjkxE4uxvpU1m9QSbdQfcOSKc9gVmGjLjzRbRgQMR0G6k+R4IgTvdRiP44?=
 =?iso-8859-2?Q?c3ppBSZQicSzqhUn8j5XryDzVBGOVC4CeIlEnBBCxEdoi0GHG9jPIaYHn1?=
 =?iso-8859-2?Q?QN9oJzE/j+RS9O+6c9GULj3XSXPwDgj2XH6mOwmEZu74MQ/EtCJ2vPxg?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c0ab8a-672a-47e1-7244-08dd1a8a0684
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 08:50:27.3611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNOW5bfYmKtk2xnb/31CHE1I3llX4e19XxJ+3EPN7PmB9CYvjdVVYDFd2/V3tNKBpjYb3zr7jBltgFr4+7CIqjTrVdWOiERPuX4uY2sxAPS1s2XRbqvquzi/hLlsjd52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Wednesday, December 11, 2024 8:18 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Manszewski,
> Christoph <christoph.manszewski@intel.com>
> Subject: [PATCH i-g-t 2/2] lib/xe_eudebug: Fix and update event filters
>=20
> At some point (before upstreaming) the eudebug uapi changed and
> the 'DRM_XE_EUDEBUG_EVENT_MAX_EVENT' definition was dropped. Use an
> existing event number for filtering out all events and add missing
> filters for events introduced along the way.
>=20
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  lib/xe/xe_eudebug.h | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>=20
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 9aadbe847..823c7f6ea 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -114,17 +114,21 @@ typedef void (*xe_eudebug_trigger_fn)(struct
> xe_eudebug_debugger *,
>   */
>  #define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		60ULL
>=20
> -#define XE_EUDEBUG_FILTER_EVENT_NONE
> 	BIT(DRM_XE_EUDEBUG_EVENT_NONE)
> -#define XE_EUDEBUG_FILTER_EVENT_READ
> 	BIT(DRM_XE_EUDEBUG_EVENT_READ)
> -#define XE_EUDEBUG_FILTER_EVENT_OPEN
> 	BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
> -#define XE_EUDEBUG_FILTER_EVENT_VM
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM)
> -#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE
> 	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
> -#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION
> 	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
> -#define XE_EUDEBUG_FILTER_EVENT_VM_BIND
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
> -#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
> -#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE
> BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
> -#define XE_EUDEBUG_FILTER_ALL
> 	GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
> -#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << (_e)) & (_f))
> +#define XE_EUDEBUG_FILTER_EVENT_NONE
> 	BIT(DRM_XE_EUDEBUG_EVENT_NONE)
> +#define XE_EUDEBUG_FILTER_EVENT_READ
> 	BIT(DRM_XE_EUDEBUG_EVENT_READ)
> +#define XE_EUDEBUG_FILTER_EVENT_OPEN
> 	BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
> +#define XE_EUDEBUG_FILTER_EVENT_VM
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM)
> +#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE
> 	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
> +#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE_PLACEMENTS
> 	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
> +#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION
> 	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
> +#define XE_EUDEBUG_FILTER_EVENT_METADATA
> 	BIT(DRM_XE_EUDEBUG_EVENT_METADATA)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_METADATA
> 	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
> +#define XE_EUDEBUG_FILTER_EVENT_PAGEFAULT
> 	BIT(DRM_XE_EUDEBUG_EVENT_PAGEFAULT)
> +#define XE_EUDEBUG_FILTER_ALL
> 	GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
> +#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e))
> & (_f))
>=20
>  int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
>  const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e,
> char *buf, size_t len);
> --
> 2.34.1

