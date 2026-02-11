Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CF1EB595C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 03:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE6110E0F4;
	Wed, 11 Feb 2026 03:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loadxNgJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C482710E0F4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 03:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770780039; x=1802316039;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xrCXRERY88ag/e77OYhyEpjMsqMABMKWybAJtT09M+k=;
 b=loadxNgJoVNZ7YvI1A69T3Zc1zfnMri+Z0cTqMXIKb583ofSSIeJCoOB
 qWTIaI4zUtognap1xLM6ILGPrl8UUkwQuVI+f3qlOoIbyMQ62pUzbqKaA
 UXZt1jM68ASgT+RuNdsFlF/rnHZ7bLZ/JaiSK7Cv4PHXPOQZ6ZRTYXM8P
 RLmoy8LPl8u8dCQ4vWSFOmLb74vOnivnRYMDOv1N5/cPpcPmn6iXMxRwP
 F3X3A+9yOrvPRG3iolFGyQdINCBcd3sxLNDW0qeL6zornWMw3IIZ6mm3+
 MoCAycUbDogoRRHqEnGVv4ViT9t1ZDz67lEiV1GzWqq9+di0CDyxj1JmM A==;
X-CSE-ConnectionGUID: ro/yZzxJR76jnj+L8PcSdQ==
X-CSE-MsgGUID: waSVQEP3QDClZjuszYjGyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75765822"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75765822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 19:20:38 -0800
X-CSE-ConnectionGUID: feHdyxcxSweDTvjM3TloYQ==
X-CSE-MsgGUID: vUgL/vMOR/qznwDHDHkkPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242717082"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 19:20:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 19:20:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 19:20:37 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 19:20:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLH96s+Dbc/YmjZexG2OkjPgGU7mlocu1EX6Sm+J7kWdUagekdSAZ5X//t5StEVMOtdinbee8+QhBhR/y/Bwg9Y8U59WItlSqq/Xlj9wD8kVPenq/FwrLftCXuw/O921n6Z8/xmhtFAZrVHFa/UqK96j2AGLRcIUfc/5i5uGvhMkzknB+i5eX79byB019faUhIebuh2rSRMWc9geC7cZEOPS8EyStnitgT1hvmaAlwKh/yyTZg5/OkjZCJb+BRf8XMbWSaM7nFtYaTxcAcapA8wxHDwBhKE8yijzE0oHOjYAFFjn5OohRsM/dL88UO6AdvmAPC15W4X9rFJvfGsHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB7EXHBTgKaEaj8VTYJgYSlCSnGw6hLNENncjon4Gbg=;
 b=e/G5OTdb5AONEoGWv+nftO7P93unAWKFdou3nYCsQ3W3Nxwx1UwYoCxYCfxPixJnFpL1YYJ6MuANoUH7Y22lYgjqY++Kpke6d0W4h7cBF6r0UyKyAftpJvX4LhCYM6vjWXxMAo3tGuoN/u6mntc6YLOnqyCnM32kbtBN5ks5GbNsi/vKpBNs9LEtV65oxgLcvPhQsJJhi9kXlkxH4TMX4rFg2bMRI55itpQyxtKjiD6CXDmDeFhah7HKuXycofi8ugFwdrKD7PjoNsoQnCvbNw4Ngq3JcjCyvInjp1EQ1eA54EuM7p78vwhZmR5L5tqC8qRe9KgdY3G5pemUrKqJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.14; Wed, 11 Feb
 2026 03:20:30 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 03:20:30 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
 unbinding xe
Thread-Topic: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
 unbinding xe
Thread-Index: AQHcl7nHAvt8S4Eg8U6YSj3Ebv8F2bV7Q6MAgACubgCAAOkJcA==
Date: Wed, 11 Feb 2026 03:20:30 +0000
Message-ID: <DM4PR11MB6312D165F0D77FEB6C0A71669063A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260206224106.3845768-1-michal.grzelak@intel.com>
 <DM4PR11MB631299DF160170E04D441FCA9062A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <28c8c955-306c-7e90-6474-051a350eb6d7@intel.com>
In-Reply-To: <28c8c955-306c-7e90-6474-051a350eb6d7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM3PPF9EFFC957B:EE_
x-ms-office365-filtering-correlation-id: b82dad3e-803d-42af-e94f-08de691c82b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-2?Q?6rQaoPv1d/clF1fLldCK9nosXfE4rtPpD2BL1CZ2il9y1tEenLPFb47xTH?=
 =?iso-8859-2?Q?hUekH+phBibPDI8+/RAyTVLbrabsyQmBYReu7yWcUZY0pctf4L/6kmyKyV?=
 =?iso-8859-2?Q?t3uprGmTMeFR7UApdcPyr2RA7Da+NQmTx105vnM033SREo7UGDpEFYdPc4?=
 =?iso-8859-2?Q?lkGdUqz+JeF7B43G5Uw1d4aQRS8afSt4qEmxfv7Ctu1wpzDmGTNXKz1ke1?=
 =?iso-8859-2?Q?9HRjoYRDmGrDLcwy5fzn+i7bX3q+kiejy+jW5XabFmw4QtRLOn6NJfgU4Y?=
 =?iso-8859-2?Q?8Rg0ZWldMP4Et2VGNqggMDiSPGtexf0M7AUnKufLSvUPUG4HF8TtDmvFG4?=
 =?iso-8859-2?Q?8LIbb7XG+6ECfZaUnnppPbFUlETrqOn9q+AFfhxXSadEnME4/A1WzZtNXo?=
 =?iso-8859-2?Q?tN3/PVM6eOTPOqxBm3z5Yvhm2wpyLxsDnAppVjKMSYaJC+GqMkfMs6NBl3?=
 =?iso-8859-2?Q?U507uXeddSboAIsmf0lFMTg4HvBi5Sa/HjEBcicYPDhNe8+2FVi+7E3ntt?=
 =?iso-8859-2?Q?c4JPBszdMbVkS/xuOhkpIhYHlKRs8wTZwvbxMZon7WxTvuC9pH5v9hgU5z?=
 =?iso-8859-2?Q?+jQ9YdxbMQuQTu2opq/KtBJo5l31qFf5eyswvPm5EtczgnJTsXv8Qo1T9P?=
 =?iso-8859-2?Q?1U7kVV9YNCPi1t7nD/LU7NxRivQBBt533DDGQMZ4scfVNoU4jxbKK5BwEU?=
 =?iso-8859-2?Q?kTfBQ/JDAjyPtUDzNQQFbF6znBKpkp/FCx2S6DaDXoJYxsALo90Xe/5OvZ?=
 =?iso-8859-2?Q?AtAq5tS4gjdXDuRsO23wlT3craXLKUzHT8NFdiqt4R/PJm3InGEbGgH6jN?=
 =?iso-8859-2?Q?93k8wzOpV/KyxRYqsu8SOZLagCCdUvDCdDhCzEK9tVV6TS1hcXA4C6uOyP?=
 =?iso-8859-2?Q?b4WC05RFSuE//82UE/DENlTQQ3ZqXf3YshQXc1l7cXL8oaolCZs2RBcQJ2?=
 =?iso-8859-2?Q?BxQj0mtI6tctAglW8eWSAsUSdbaoMegV+EOs+vhWjE42+q6E9L2jyKQVkf?=
 =?iso-8859-2?Q?mTjkmUPHvqPPMbs8qRiG71re62dmmu/+01tNeLD8/r3zzt8Dd1yjrZnAqJ?=
 =?iso-8859-2?Q?xTpAdl6GQQTy4bMnjd6iFj22z3vhP+pkjvgS9Oj2iWgJ10t0NVNfssXVZl?=
 =?iso-8859-2?Q?fpb5qKRMg3qtH9Id59/Rjengg7aFWt4u/prwFtWWFOkqLH+SgGLUv3g4aM?=
 =?iso-8859-2?Q?Y4F6rwujtZUR/QlmyHw3VxaLeSbRrPiEMsU+A/fS8xg8eNafZ6G+GwDoJV?=
 =?iso-8859-2?Q?no80qNq65qIwW2kMK793MKp7OMwpeutgqJLLWizLg2HE/q247dGAYatd5o?=
 =?iso-8859-2?Q?pE4RsVXQLKBqt1bB1vT12PKGLzAPOomelHysqkkOD5U41WpNCu9c5hLHjH?=
 =?iso-8859-2?Q?lQSB07ni9aBWoDGJE+CnH3h55hnMJ0v4KtuwB+uYvr9prWiMRmhYovcT4r?=
 =?iso-8859-2?Q?C68qZMGTTcrGgWzaB8X6iUSWqO/vGLEGRldvLOCdSlEy0CO0QLJdC4x1Gj?=
 =?iso-8859-2?Q?AaJb+GEKSCiVRwWtjecUJAuTYVaEstkMDWyvJceIK1iML8+n45HmcL5Cok?=
 =?iso-8859-2?Q?pYNdMWIY5mUGb4Jj/8aJ6fD4pHW31XgHyBLKpdvRTKPx25fvA5e6hUAG+9?=
 =?iso-8859-2?Q?cUoZyhp77677GpZq8wdDInPKBkFlhmwyWM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?0wxN6HrqEXumoPh7BtpxqUzTQnr1pchoT/bZlO+4lZv1mxFAbOQOx5doQW?=
 =?iso-8859-2?Q?+Z9jyrqVcZnxVeEjy85fL3CLlKGCaTDRtU/K1+C+M+JQ+9CUzj+dficBop?=
 =?iso-8859-2?Q?aimwxPWD3gNdkLGHwAcIbAHX0JIG6GQK2RYnxdeKPXenr3oT3dZ+1W6l07?=
 =?iso-8859-2?Q?boBnzqhYrx8Xr8d0SUSTwLR+sog+wkbXtehZQVur8AZPvdZC5kvXPBYK54?=
 =?iso-8859-2?Q?PldHjzVfpcxe6sBcF7EvL+BsYmLiiJL9Urjw8ozxPBV5CCvh6DLn5/B4ex?=
 =?iso-8859-2?Q?9IbbLdenpGxhnqRdHaTH4Lc6dzqJGouOFSG+x22eWLMSPkOpGImiIsqPi0?=
 =?iso-8859-2?Q?1Rfp8T9mFvJbR+wp0POxclhB6f3UQa5FL0xHVkTy12xU5bDyDbzerVx/7W?=
 =?iso-8859-2?Q?yGjam6R3EhvhBBI0vdbKN058tHaz/dp1KJJPVsMIgl9HVQbqqyel3qNNPy?=
 =?iso-8859-2?Q?KdK7SA/eQrWmZXNKDRwUhUlhqcYhEDmRbreDgbvOeawt5HAn0cP6Xrn2o/?=
 =?iso-8859-2?Q?WMt24hJMzvopMFD6ebS+duglLdRxOfw6OAargklrQhrHhfDRcQ3hhUJraE?=
 =?iso-8859-2?Q?UqUul/gxZ9DCYWZ4c8Mdn6oOtfBJwFc3vvx0A31hCr14tH2iwiTTm7vTts?=
 =?iso-8859-2?Q?fd/4bRAUrjAcvzXRg8IpkybpG9E9H0pRqTh/wXHgR5xCN5u9NY8kLmD/5f?=
 =?iso-8859-2?Q?0R+kKESIHj7YOnhRhA5quAytFDwB79Bqg71Xo6qpTi5gggmAWOcbYKt/t0?=
 =?iso-8859-2?Q?8t8OL9YPMbwf0Yh/7B0f473Ffr4bK7ob2HK3ljPM+Z/j67Tq3YQwC56obY?=
 =?iso-8859-2?Q?vaqzSqSZisRCKL+xnS7v086h9jqM2MKKN7u9j8B2DiXbV+FeOqI45UzikO?=
 =?iso-8859-2?Q?ecIP9uweCubMWxqZ4x7S3Q3YYW9ThMS+3ciwQcyaVe6EkyNi1sNkR+tnfg?=
 =?iso-8859-2?Q?1rDLX9hU/9SZiUgkFbwFpxRQ8G4wpNMt9U9fnWvOsN+/QTafwAvwPAfEZP?=
 =?iso-8859-2?Q?g6jHc9w2Pb2aq3cSZYwptU1cAH8l0qpkhw7zcOyob82PhMbao3koT/fJbI?=
 =?iso-8859-2?Q?qO1k1wtOsBq1beW8dLl28QTtvZ0IJ+FlN5GR9NknKkHpgQazOhwsKYRu5M?=
 =?iso-8859-2?Q?R9p+ijIjTN2x6fCNvCKyAV/fwVCQm6hB9+kO9mCnutThTZFLplUWuX4hua?=
 =?iso-8859-2?Q?so35o3NQmNZN8xXSy57zh9eqQ4c8us9pP56m2KNnWKtmOj56NiliEm/GwQ?=
 =?iso-8859-2?Q?/b8crO0zWC8VDL3xqKA/3uvO3PvQBPZmQIeA82xKDqUe+FdalySbl4ExmU?=
 =?iso-8859-2?Q?SIIcQ6g3YzAWOeJYGFk4ymJ4c4Qsn8NbrhNXEBhb2L1fZLxrX5Zw0f5iYZ?=
 =?iso-8859-2?Q?Dge2JI1wEr9fq+NYWazuABi6kRJCan1XZaiTOIsAxOwq+sy2R9Pt95A1Cg?=
 =?iso-8859-2?Q?6g0b9WiZOJ/qoCzLjuQyfgn1RsBATR0rhuXjFft9EQXHVxnbvHgi8gwfgb?=
 =?iso-8859-2?Q?HBvnb38JNFpLtqASchCkggJUo8k11N8oTpCz9yi8Nd9ygivv9g5hk6kKLZ?=
 =?iso-8859-2?Q?7SVrvrUbNxzDk6WLpyYrznSPwmU1tCAQuwXVM9pnqyYYMCpmvzUTtRX37I?=
 =?iso-8859-2?Q?9V1q97x0so+tkZXHEza1/9b6o9LtwtGjy+0c7ApQCf6OhQjTS5c4JhB+Zv?=
 =?iso-8859-2?Q?4kPC7Lw6Ii/z2XreciLnmaSmN87bKejNp1GXGgNqGyqhqrMQirx1/jzZYe?=
 =?iso-8859-2?Q?fzftWFwcFGuT9S+aM/SDHNfXtcZN4udh0F3EjzCuk/vrUi?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82dad3e-803d-42af-e94f-08de691c82b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 03:20:30.5257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nscTm7iD6CrQ45ZBK3lcjZ8BxMdSLlGb5fUWzEad8OZL+1GY6BItI7Dx09FZ7PCzSsYuX4q4cayX4E7kG93jIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
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
> From: Grzelak, Michal <michal.grzelak@intel.com>
> Sent: Tuesday, February 10, 2026 6:56 PM
> To: B, Jeevan <jeevan.b@intel.com>
> Cc: Grzelak, Michal <michal.grzelak@intel.com>; igt-dev@lists.freedesktop=
.org
> Subject: RE: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
> unbinding xe
>=20
> Hi Jeevan,
>=20
> On Tue, 10 Feb 2026, B, Jeevan wrote:
> >> -----Original Message-----
> >> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> >> Micha=B3 Grzelak
> >> Sent: Saturday, February 7, 2026 4:11 AM
> >> To: igt-dev@lists.freedesktop.org
> >> Cc: Grzelak, Michal <michal.grzelak@intel.com>
> >> Subject: [PATCH i-g-t v1] xe/igt_kmod_unbind: release audio before
> >> unbinding xe
> >>
> >> Audio driver should be unloaded before unbinding/unloading xe.
> >> Otherwise audio has no chance to release the refcount:
> >>
> >> <7> [485.586766] xe 0000:03:00.0: [drm:drm_client_release] fbdev <3>
> >> [485.587690] xe 0000:03:00.0: [drm] *ERROR* audio power refcount 1
> >> after unbind
> >>
> >> When audio is not properly released, further testing leads to
> >> warnings, timeouts, etc. Release audio before xe is unbound.
> >>
> >> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7169
> >> Signed-off-by: Micha=B3 Grzelak <michal.grzelak@intel.com>
> >> ---
> >>  lib/igt_kmod.c                   | 1 +
> >>  tests/intel/xe_configfs.c        | 7 +++++++
> >>  tests/intel/xe_fault_injection.c | 3 +++
> >>  tests/intel/xe_survivability.c   | 2 ++
> >>  4 files changed, 13 insertions(+)
> >>
> >> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c index
> >> d1d7a3840..82c005ff7
> >> 100644
> >> --- a/lib/igt_kmod.c
> >> +++ b/lib/igt_kmod.c
> >> @@ -716,6 +716,7 @@ igt_intel_driver_unload(const char *driver)
> >>
> >>  int igt_xe_driver_unload(void)
> >>  {
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", NULL);
> >>
> >>  	igt_kmod_unload("xe");
> >> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> >> index
> >> d2dfd2e87..9f32e2fc1 100644
> >> --- a/tests/intel/xe_configfs.c
> >> +++ b/tests/intel/xe_configfs.c
> >> @@ -55,6 +55,7 @@ static void restore(int sig)  {
> >>  	int configfs_fd;
> >>
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>
> >>  	/* Drop all custom configfs settings from subtests */ @@ -69,6
> >> +70,7 @@ static void restore(int sig)
> >>
> >>  static void set_survivability_mode(int configfs_device_fd, bool
> >> value)  {
> >> +	igt_audio_driver_unload(NULL);
> >
> > This should work fine when we have unload and load tests, My doubt is
> > that when we are trying to unbind and bind if audio driver is unloaded =
Will
> that affect any tests which has dependency ?? kms_hdmi_inject tests.
> >
>=20
> Just got ack from Kai and either unloading / unbinding audio driver is go=
od.
> Shouldn't affect tests with dependencies.
>=20
> BR,
> Micha=B3

Thanks=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>
>=20
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>  	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode",
> >> value);
> >>  	igt_kmod_bind("xe", bus_addr);
> >> @@ -113,6 +115,7 @@ static void test_engines_allowed_invalid(int
> >> configfs_device_fd)
> >>  	 * These only test if engine parsing is correct, so just make sure
> >>  	 * there's no device bound
> >>  	 */
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>
> >>  	for (size_t i =3D 0; i < ARRAY_SIZE(values); i++) { @@ -139,6 +142,7
> >> @@ static void test_engines_allowed(int configfs_device_fd)
> >>  	 * These only test if engine parsing is correct, so just make sure
> >>  	 * there's no device bound
> >>  	 */
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>
> >>  	for (size_t i =3D 0; i < ARRAY_SIZE(values); i++) { @@ -169,6 +173,7
> >> @@ static void test_gt_types_allowed(int configfs_device_fd)
> >>  	 * These only test if gt type parsing is correct, so just make sure
> >>  	 * there's no device bound
> >>  	 */
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>
> >>  	for (size_t i =3D 0; i < ARRAY_SIZE(values); i++) { @@ -231,6 +236,7
> >> @@ static void test_ctx_restore_invalid(int configfs_device_fd, const =
char
> *type)
> >>  	 * These only test if command parsing is correct,
> >>  	 * so just make sure there's no device bound
> >>  	 */
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>
> >>  	for (size_t i =3D 0; i < ARRAY_SIZE(values); i++) { @@ -310,6 +316,7
> >> @@ static void test_ctx_restore(int configfs_device_fd, const char *ty=
pe)
> >>  	for (size_t i =3D 0; i < ARRAY_SIZE(values); i++) {
> >>  		const struct value *v =3D &values[i];
> >>
> >> +		igt_audio_driver_unload(NULL);
> >>  		igt_kmod_unbind("xe", bus_addr);
> >>
> >>  		igt_info("Test %s\n", v->test);
> >> diff --git a/tests/intel/xe_fault_injection.c
> >> b/tests/intel/xe_fault_injection.c
> >> index f3bfc4b40..65add71a1 100644
> >> --- a/tests/intel/xe_fault_injection.c
> >> +++ b/tests/intel/xe_fault_injection.c
> >> @@ -309,6 +309,7 @@ static void probe_fail_guc(int fd, const char
> >> pci_slot[], const char function_na
> >>  		fault_params->times =3D MAX_INJECTIONS_PER_ITER;
> >>  		setup_injection_fault(fault_params);
> >>  		inject_fault_probe(fd, pci_slot, function_name);
> >> +		igt_audio_driver_unload(NULL);
> >>  		igt_kmod_unbind("xe", pci_slot);
> >>
> >>  		/*
> >> @@ -662,6 +663,7 @@ int igt_main_args("I:", NULL, help_str,
> >> opt_handler,
> >> NULL)
> >>  			oa_add_config_fail(fd, sysfs, devid, pci_slot, s-
> >>> name);
> >>
> >>  	igt_fixture() {
> >> +		igt_audio_driver_unload(NULL);
> >>  		igt_kmod_unbind("xe", pci_slot);
> >>  	}
> >>
> >> @@ -673,6 +675,7 @@ int igt_main_args("I:", NULL, help_str,
> >> opt_handler,
> >> NULL)
> >>  			err =3D inject_fault_probe(fd, pci_slot, s->name);
> >>
> >>  			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
> >> +			igt_audio_driver_unload(NULL);
> >>  			igt_kmod_unbind("xe", pci_slot);
> >>  		}
> >>
> >> diff --git a/tests/intel/xe_survivability.c
> >> b/tests/intel/xe_survivability.c index 552414903..e842a76ec 100644
> >> --- a/tests/intel/xe_survivability.c
> >> +++ b/tests/intel/xe_survivability.c
> >> @@ -150,6 +150,7 @@ static void restore(int sig)  {
> >>  	int configfs_fd;
> >>
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>
> >>  	configfs_fd =3D igt_configfs_open("xe"); @@ -162,6 +163,7 @@ static
> >> void restore(int sig)
> >>
> >>  static void set_survivability_mode(int configfs_device_fd, bool
> >> value)  {
> >> +	igt_audio_driver_unload(NULL);
> >>  	igt_kmod_unbind("xe", bus_addr);
> >>  	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode",
> >> value);
> >>  	igt_kmod_bind("xe", bus_addr);
> >> --
> >> 2.45.2
> >
> >
