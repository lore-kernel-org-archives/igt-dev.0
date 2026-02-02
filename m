Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E4ED172CC
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 04:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB0510E1DA;
	Mon,  2 Feb 2026 04:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgbxLSql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9810010E1DA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 04:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770007015; x=1801543015;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zh+7O/mjvPX/9TMcCI/vjGG+rUFnP9Tox4jro/VY4ew=;
 b=EgbxLSqlV0ze0JcMNYBQjTwk8XGVSszBjXTPvREdADFBoljBMXGrJ2bh
 84baBdWIZDyciqFFLzlKKZOPDrPNTyVF4j5DCkMH27vzRewiZQ5eqvpjv
 eeK5F5tBx/dRvnXhttgs1Ez/nNKHoVucNxxERltwqLRolhfaN4YBjeExT
 yUWwX8draJzv8VnpyWlshp5AQlg08dgYVAQSzIAppo3rk8HmVL79lkZGT
 Zwttn/kqN4pbUN3fvLsot2Ntyc0/0SVrg0lNmgOW5RMW1gWMtyfK8hDKH
 UcdqaLeIMgURs2yoNIFIlHPbbB3zra93K+lq8oFC4TffceutlFHXZPMP5 Q==;
X-CSE-ConnectionGUID: paNVQexeQRazZHpxw8YkOw==
X-CSE-MsgGUID: U1SR+OrrSee51o/ID/44yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="96620930"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="96620930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 20:36:54 -0800
X-CSE-ConnectionGUID: Ub68k32lSdmd+pn8DrMmhg==
X-CSE-MsgGUID: wi23RphDSOGGOZMo6Hmu7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="209490550"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 20:36:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 20:36:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 1 Feb 2026 20:36:53 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 1 Feb 2026 20:36:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saQv3cu8GXJJOfXnlmWoMyA4dqqqF/7moIQrcFqHor7dn+TtY3f6oeLZkXSKxhGI9VB6STpX5YaRxLfXToc8XjuyoBX7/kQBIOdA6RGoF4lDc23a6lYpHcaQ9C0oyWY/LoOP1wzGzPQy2AXjbLuJW52o+g03qodzPnPTi+7ln0+ymdvaFAGFmGfdZtIZRrKaZvMtt6kLuF9A2C0D2PNVOjzdgq+qeBvups7nfC3cXFrKOY3USFKXlRicu4ZJnhrZVZh/egLKVJApLUcTzaMUH+d2KfO3yYkLPrcY9AUnsLDrOLCjOygk6os9nS0TFoWNmrIEeWzbzf2tMFzdSlRTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dISmyJjESrcdibm8DVFfM2Ico/mx0e+ApbaT949ZUc=;
 b=O03W1UPYyFodE26lpZrztvum4mTLGeKpzzCjuV3+yztyriOW4uF31gTUTezzUSSarYdwB5h11cz9demPza3BW8ebXxLtzTinffLKLz/DKJ3mwHVjmCYfCeSv/T5PqdCAuO++xl6omCcM5+XPNTrF25YotkT+kKxjiIMEnovMaGSiz/331Lb1hanAQe39O/A1uaSbh/OrtSO6+5TtS13ekadvVQoygF9qc6ZeU/CeT5CgSdEfa2S2ckJOgj/cDlHK9QswXbxICfIRy8jGtFNgH55t+tOccIbi4aJTxPrLX35f8bCILKmGSxsTZhHIqKWvgnxiBj0I3eouknZxA/PZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 04:36:51 +0000
Received: from SJ0PR11MB6814.namprd11.prod.outlook.com
 ([fe80::d539:191c:91b1:6b5c]) by SJ0PR11MB6814.namprd11.prod.outlook.com
 ([fe80::d539:191c:91b1:6b5c%2]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 04:36:50 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Topic: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
 invalid_fb parameter
Thread-Index: AQHcj0MzgNJJB/6kHE2kGRyU5XzyvLVlroQAgAABSQCACSqDMA==
Date: Mon, 2 Feb 2026 04:36:50 +0000
Message-ID: <SJ0PR11MB681479515CCF0932D28748D2E59AA@SJ0PR11MB6814.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-8-sowmiya.s@intel.com>
 <DM3PPF208195D8D473384C8865D18E79369E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DM3PPF208195D8D791E83C84958C85F3423E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D791E83C84958C85F3423E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6814:EE_|SA2PR11MB4905:EE_
x-ms-office365-filtering-correlation-id: 219ac625-7f9d-461c-f105-08de6214aeb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ttKiZi/G7IxFL1YSSEjwUwRTUJCbC0ZemR7S55qG41GlNurdIm+bSkr0clZf?=
 =?us-ascii?Q?E6U9+ZsKlGZ4Hnot8AGCjc3SdvlsNah2pRonNqQbdRfOWI1EIhlfEf5Thfaq?=
 =?us-ascii?Q?u2dDXdfUPmzC3H+wSgDZSh9SkS3tdatdaY9EhQxMOMLVLMOZ7ZW2VNx9pBmG?=
 =?us-ascii?Q?uV2VOe3iG/0KCM7rBZ/eBoYPMvT5mIj7+gFSf0+bK3WTRwVG1HtS0HMrVRTU?=
 =?us-ascii?Q?bvlW5DMO0ZETBXPgpbVkSwJDNFXX1tx3B0OZU0PSxPpH0F2uYEx50BWxSLVB?=
 =?us-ascii?Q?D6IAnw2NFBVp9EhjQTJwtjW1+k6Lxrm5iDbWShyjIcW5kYI1zCvSvne4vCh2?=
 =?us-ascii?Q?ysnCXpUAn3erJEixSlrQKHMckGqrmz4x5r9JIOwv9Vp7CsbL3XGqMkibVkK9?=
 =?us-ascii?Q?LZeKoKazHa8gMi5Gm7uTQGVP/Ogkf5GoUYv510njGNJ1dRtQ9T9YFtewsIwv?=
 =?us-ascii?Q?9e/5LFgBFLeAflu2cpTWDWC2NR0PeQDXLQLVvu9DiXtdfyn2f6p35XhVESWd?=
 =?us-ascii?Q?fRdgQysDQI9wQqXntsaKreUtY+9cmHMHBH+dHv6kGgn14kQ3da32e0nahiVe?=
 =?us-ascii?Q?njFB3qhvODmJAJaiT9VjLClorowGZbcMeM70zwdx7sysPI5g3udhm/BhCFNZ?=
 =?us-ascii?Q?KsfPCbwmqbTfI3MUQjuSEmkrOcm5kxDAx1qQBQTeQ4KQBssabgtSDnzix2cd?=
 =?us-ascii?Q?4fSDM0CLewq7UWUea0fCJh3IygdsRI68iltGjZ91r0LLBXrx4yWwSg25uf0E?=
 =?us-ascii?Q?ingJUarHx+Rk3ClJcaFObecO5pChZL1zoxLlEL5rKNLu3zBtx61Kgjz3za2J?=
 =?us-ascii?Q?mbfzuPuaaWtOc+Chulgo0tnrw6/erZumqKYKt8iQngNwQKgN+T+VdDjP4VJU?=
 =?us-ascii?Q?QwN1QMvw1mAdDdoby1X9HjEFG+nEpDkOUhA93qv09F41qDleMCJfFMLg5KUb?=
 =?us-ascii?Q?srZCEKsUUTkoatX3JiDsWlgVVJuvIBMe1tas4c79c9mrejujMiCa8h4lIPOO?=
 =?us-ascii?Q?JKTgR9nXkW6D/nGUV/ukMx2unbISfzqyfWdICppYN5Ww0CYcTjO/+wdBDArf?=
 =?us-ascii?Q?OueQEnjoWY0yB04cOiTX5yImYu/kgMC53DoNvuOxvLWXP3e2h+Ph/LS/SeKl?=
 =?us-ascii?Q?UFzT0vCo2A7pnU1ZOpcJvp5dMjm5PMFKzEK5f1dweUmTrdTa3f3SSFsy0fMM?=
 =?us-ascii?Q?c4Rllj2seguSocPtyx2tb5S5QxYfPLHMbPe3SjHmlRbW8JgcVugDrjw/Bc4n?=
 =?us-ascii?Q?oVSgHEjXmfw7Y/mt8rUcRtenrMmaF6VtiT6PbHgg0ucIx0xLsjezn+AeD4gi?=
 =?us-ascii?Q?fv71GSGX2FsAt2EHzeCvVWaKSY12eMxUnUbEkGKsajXSlWbceDK/Jq4lxy25?=
 =?us-ascii?Q?f/1H/tPlGHnAv6LGyzwWouX3ki8gdOy0BLdZlfjCyjgoNpq2GkTaJYVD/VNv?=
 =?us-ascii?Q?kuthOeSV1kk56HMU6LbQEumfNytbZ2Mm2VFl6HvxFYzn4xgbaBhAtXabF3zV?=
 =?us-ascii?Q?YJxl2uR/wRSsOdJicFTHbwk6Av+H7MjJcMoDujhW/qWtm9S9leCUYF8VAmDA?=
 =?us-ascii?Q?cOSjhEbB1Ztr8X+wpudSY1h8ZQn8FDjT2ICsnRXYbhsSjbugPsl8mOyL+lIY?=
 =?us-ascii?Q?zeUusVu12m9HP3Jf+9tavK0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6814.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FsGwmbXZytN2NzwK6gxhEjWbMRDzSWDW9xW/wzfVbYxR4KPipIQAw8zvlg7/?=
 =?us-ascii?Q?wLx6tizd0e2b5gWHEcltP058QElCh5hjwZJ8qWAJFmgZNGl9McxcfrGIliCV?=
 =?us-ascii?Q?JActNAxQdbtlsIexvxW2a7Vn3EU+eSCjDs45s7Ep07B3mqPclyh4y/p12O23?=
 =?us-ascii?Q?GHD+U6PHwKpx6gOEgQZNFNNsxWRy4vh7fDlM0cJ5Vdr0yEDp/mhoukQanxiY?=
 =?us-ascii?Q?PPmRbgLIgXqUlmmdZuyVtGIxT9rRLS+RI88Smk4JcD47EhLvNUooCLA3Iq7f?=
 =?us-ascii?Q?KZ2VZmzRQYP0uQszFz2cJD/9uT0xa9NCtX++diNGGmxh9bMn5FQUg+eK1uCz?=
 =?us-ascii?Q?iMJbLAFFVRuO83RCe11/maCfrIxnJUY/qyLjSpErFYiRGBoZwEeS/tdFemyz?=
 =?us-ascii?Q?hW5LZN/nxBcsBR/5BT/7lIMCmSy3wAKyh+GmcGiqmPh0iH+BO0xBoiHMX5jQ?=
 =?us-ascii?Q?DVBBiorODATuJmbf7nl7LDaK5ztST2ohnVGnORkstEz9OLnJzUlNoHvASKsI?=
 =?us-ascii?Q?ob4/SLq8Ig93DjaDmgjzS5xoA8TnuhcPxpt7yl46BfjnYVaCGNn4snX+N+n9?=
 =?us-ascii?Q?se+bP1EvXHM/18QXTCe5uILed6FGgv6mbTrXulpdm3hK3Imfnl9ispGPycv6?=
 =?us-ascii?Q?x11ATH6LflEaLRCg4TWtQNi30FHUmeixwC+p7Q6JZrXa5qFUj8Ialloqh+1H?=
 =?us-ascii?Q?YhmqYA9NawjwPqw4i4ZnnUP20lm+JaoRWNbYQM8i5erhnWZcg+RFl2vK45sL?=
 =?us-ascii?Q?ylCP0djcJzU0K4JefydfzkWjSNkPig0qneE9a6zIGgEFMI3iuyIFcs1LPPLj?=
 =?us-ascii?Q?Aps0PMqBcsZY2h6sgMVFZLXjjfKgmp0aKvaP4Tlhjxnn5xvKXilKwApLK6Ls?=
 =?us-ascii?Q?zfxXlh6LmdonYS04OkPCKoW7ffV/RLoG2bo1Lt9F2JeIIDblCNa3n9FvjaP6?=
 =?us-ascii?Q?On/pWcRrMskfFUl8TL2WLPjZ8gC1YZ84gaUKjT/WRd7GXMFOatoy3Z1e2teJ?=
 =?us-ascii?Q?o0g61sLPu3Y8crxEC6gJvwSoKRIzZLN+mL/PASWkDYWwRbB+zWWwWVo3dInN?=
 =?us-ascii?Q?YbsyvA00MkfBOS+FFFIR4Tw1gHoi1w0C20n121xSHkDVEp787dwq+CVyRZN7?=
 =?us-ascii?Q?aXNV4ZHHuiXPzAlbKeD8sy3HX9T9M3o2DqN+dmiUcQG74qR4Ma1VfAr/1nOT?=
 =?us-ascii?Q?Q2BegeLweAPZ2dSC/E/g6vGtE3pJCri6ROO91+uNgz2WWEyNsrVd0jSjgJkg?=
 =?us-ascii?Q?e+FWrJcn0+fzKoT3cMgGjSEO93BSZNwiHde6QXhoXYaO8irllE7gm1wAgF7X?=
 =?us-ascii?Q?xP6ZNotyTCMsY4/rZe7nhfJkGGX1fbH02UauGvCBVsT5kU6x3HUxg1oR+IIu?=
 =?us-ascii?Q?p5XynV5HwB2T+DpBHWnhzCaUJStyYlydLpO65ZgNLJpZB8COi0xO217f5L0k?=
 =?us-ascii?Q?a3nmLlt2Xn2cxTduxzD9U1aMfUE/Y9vqHwWH4/aT9k5zJ2JtQhg0KuY4tIvU?=
 =?us-ascii?Q?zfeCDFeBCvFtNxlRgql+l4SGWXhc3p+xydEtSy0PZNor8MytXI834B+Wsrzn?=
 =?us-ascii?Q?qVloqQ1Zb0ADB8ouSZMofgHpKrd1u8rLKBY1VvO6E238t9evwYM+imDw3jig?=
 =?us-ascii?Q?Up5KE9Amsgu7e+U4GsE4Yz8TZDhbH03v8bnKQN53V929PeVtI07dP9o/5Bkf?=
 =?us-ascii?Q?bazunlv/j8LxEFy4lYJ9qiLcDFtJMcTOlSo7XrNKqTtM2DKa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6814.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219ac625-7f9d-461c-f105-08de6214aeb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 04:36:50.2720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvQNg8zPg8gH5Oi+UPq+K5BvmcVK5jt54PSZVj3RherVot6MXGheFslwQ3xG4Mh0eCL72wfdqc5XeWSpa++LiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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

Hi Suraj,

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: 27 January 2026 14:00
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> invalid_fb parameter
>=20
> > Subject: RE: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > invalid_fb parameter
> >
> > > Subject: [PATCH i-g-t v7 7/9] tests/kms_writeback: Remove unused
> > > invalid_fb parameter
> > >
> > > Remove the invalid_fb/output_fb parameter since it is not used
> > > anywhere in the test. Reuse the fixture's input_fb for both 8-bit
> > > and 10-bit formats to simplify the setup.
> > >
> > > v7: Remove invalid_fb in a separate patch as per review (Suraj)
> > >
> > > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > > ---
> > >  tests/kms_writeback.c | 12 ++----------
> > >  1 file changed, 2 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > > 58118b8da..8d5bf5294 100644
> > > --- a/tests/kms_writeback.c
> > > +++ b/tests/kms_writeback.c
> > > @@ -297,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> > > *output, igt_fb_t *valid_fb, ig
> > >  	}
> > >  }
> > >
> > > -static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > *valid_fb, igt_fb_t
> > > *invalid_fb)
> > > +static void writeback_fb_id(igt_output_t *output, igt_fb_t
> > > +*valid_fb)
> > >  {
> > >
> > >  	int ret;
> > > @@ -706,19 +706,11 @@ int igt_main_args("b:c:f:dl", long_options,
> > > help_str, opt_handler, NULL)
> > >  			    (!strstr(igt_format_str(test_format), "BGR")))
> > >  				continue;
> > >  			igt_dynamic_f("writeback-fb-id-%s",
> > > igt_format_str(test_format)) {
> > > -				igt_fb_t output_fb;
> > > -
> > > -				fb_id =3D igt_create_fb(display.drm_fd,
> > > mode.hdisplay, mode.vdisplay,
> > > -
> > > get_default_fb_format(&display, bpc),
> > > -						      igt_fb_mod_to_tiling(0),
> > > -						      &output_fb);
> > > -
> >
> > Why delete these lines this patch is simply supposed to remove the
> > param invalid_fb since no one uses this All these deletions go in the
> > next patch
>=20
> Actually not the next patch but the previous patch and this patch need to=
 move
> before the 6th patch
>=20
> Regards,
> Suraj Kandpal
>=20
Ok, will refactor the test after removing the invalid_fb param.

Regards,
Sowmiya
> >
> > Regards,
> > Suraj Kandpal
> >
> > >  				igt_skip_on(data.dump_check ||
> > > data.list_modes);
> > >  				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > >  					      "DRM_FORMAT_%s is not
> > > supported\n",
> > >  					      igt_format_str(test_format));
> > > -				writeback_fb_id(output, &input_fb,
> > > &output_fb);
> > > -				igt_remove_fb(display.drm_fd, &output_fb);
> > > +				writeback_fb_id(output, (bpc =3D=3D 8) ?
> > > &input_fb : &input_fb_10bit);
> > >  			}
> > >  		}
> > >  	}
> > > --
> > > 2.43.0

