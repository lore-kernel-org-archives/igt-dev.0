Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C5ACF58E5
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 20:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E7310E68E;
	Wed, 19 Nov 2025 20:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnhzbC2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F0E10E68E
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 20:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763585643; x=1795121643;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=uI234He4sa06kvs6+3Mb1pLO49yGN6lwe5u3TchL3PQ=;
 b=lnhzbC2zQ4rfbtcX2KlOvyidFWwOnJna965fE0w21oJ7a7qtaZIWKLbc
 F/J/D5IKYysNJGkO5m/EX+YTVyj8EP4u3L7MJSfs+DYJLBbSsXpAcR2qQ
 dcZnMusQKkV9NO8tJnLn07RQDLSoXglf5Mc6tinQe450MolInxuxkx19H
 71TFyMaZz0gNBD04QZnf1/P+UaEW5Cv9cJrBXV3S+nCQXkFmtgIZrMtHH
 /BFZaHMX+hZhzWTfYkqp+3XNDeBD9X8tuQrcIK8qhSs0OzEp+rqWlNb6e
 N/RsikAUcd084JP8oh4YwVL99r1GzhKRKNZCfzQZi1utODoFKiqk2pa9r w==;
X-CSE-ConnectionGUID: 7T6sry/XR0ydp6ov1bR+FA==
X-CSE-MsgGUID: 3LKJSsMcR9WL58qgkqaSdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65521660"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; d="scan'208,217";a="65521660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:54:02 -0800
X-CSE-ConnectionGUID: dd4GlZ3USTK8/dv7v5psZw==
X-CSE-MsgGUID: N9iUb9UPQ92zEXE8eRJzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
 d="scan'208,217";a="196299366"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 12:54:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:54:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 12:54:01 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 12:54:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNQX23Er7NvrLnxm6Ymt5x25hikzK+5JGfDYgxGn8Tyh5q3RAnXxwLTEXs7l/ltfq04y2DBctF+RSZhDeUq7QI0ZrtJtnsWQdpeiOEiAcifk7QqESdWyWJc8ugNfpmhEVJKpWeTJ45mD3JpCekyIIFd71bLcRP+cNKbQlUFqcqDBCfFavOAsXcrUNvwxwf5IgAhizsy13Wg5xTdmd9t+IuRqcrjyQciiWL09mbw3BM8WrB5ZqEInaGfdr6seSpcLKiZ9EeNuqioyGBtN97cdNZUkZIgNKJ3TbY2DWrz1RD9rBoN/d0o+qDO+yLDtj1jq7ceSj7pOafUOXEH3WYYtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwI8RKluMPzFoFDycvddIYxLn7AAKyjUWAVlxExN9fE=;
 b=LP7fl0a5mG1gDrO8FU1iIr2YTfqjpDdYS6oKiCBD09OPv9ovHoSDOno4Hqt8d6aM4m7qwbH2K8oZ2hMaVMI8aW4et9bS9CDZyvfhW94LhguAYVnY/LgV7ZKREmG9kjTFO87P8Lgq+/VN6J0QCIGqy+rbkfsmdu5D7gVcfJ0PeGQpZELxNwPdm6T/K7PbO+QYB/I2rDCFYtwux23Knhjh3BudThdIAxm2jwzaiPiifIkywoxs+LQmfaCkprcALDUSbZImaB2isojtsHmKwO3Upc+146jOkUtfjSaYHcAZZ5198TmKYxRbytlVPykTm6G0/hjpvT231jcg+1i+jOIUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DM3PR11MB8672.namprd11.prod.outlook.com (2603:10b6:0:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 20:53:58 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:53:58 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: Add proper checks
 as R/W not supported simaltaneously
Thread-Topic: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: Add proper
 checks as R/W not supported simaltaneously
Thread-Index: AQHcSbNGrw1vFeEjW06kpd5vRPfSvLT40sOAgAHG780=
Date: Wed, 19 Nov 2025 20:53:58 +0000
Message-ID: <CH0PR11MB5427033189B320D24333100A98D7A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251030152405.3422044-1-s.sebinraj@intel.com>
 <20251030152405.3422044-2-s.sebinraj@intel.com>
 <20251118174509.r3kw2tgzmlmgml4p@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251118174509.r3kw2tgzmlmgml4p@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DM3PR11MB8672:EE_
x-ms-office365-filtering-correlation-id: f0600a9a-e38b-46ad-0ae5-08de27adc2b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007|8096899003; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?mYLrfmN6scIu+2iL5zBz6qM0ovn0rmAjjgh7elayZYQEWR87c/grCmo4rG?=
 =?iso-8859-1?Q?8piGKL1+kXHE0iN3yRpDP+xEp6o3urJlVMLJhG39ts/+1QhzMVFGfnjHfo?=
 =?iso-8859-1?Q?ZuvLNIvSERdKZX8WY1pNWk2fsmLu3Fvp6yWQPmYcSILZ9dxJqem/NPAo9u?=
 =?iso-8859-1?Q?bguFa8q2EsjARACbNaEA3j56jzJhmL99OfCaXfUxvp+0zIZgMnceKYIZ26?=
 =?iso-8859-1?Q?Ti0RwTCwd1UhCNbgDjDQJmeFY30DYtmA4bD8SSmi52P6qCIqtkTccioeoU?=
 =?iso-8859-1?Q?BAoa97euX7AbPs4CR9rYZ5B4YWlTE2r1rd36Ifu6mbjdgAsQG8FE1LD9UD?=
 =?iso-8859-1?Q?K1Xp2qcrCgXYqVr04TVnG20TqJoVDIZsxvTTAzTPTzwGeEtw4tXxVpIlwh?=
 =?iso-8859-1?Q?+pAsqUQpQjp9t/FOTCfc9MqB3eQiOkQBEe39X48HHy8ZzGJUjGUbmA6bIC?=
 =?iso-8859-1?Q?yNfnq33kBr5Z1SYHeKwUDPBdF/6d72x6xNr09MPTpDeboTiuWR5WlQTkV0?=
 =?iso-8859-1?Q?OUzvL6uF7MPnzFFskKEPxkmQJwQhiRe9lby9C2vR7oAM5d0R1/WhQqMBEF?=
 =?iso-8859-1?Q?gmqFFDWce5ejyGba6hYDOqmvszZlqzslUXMgmmN4A1dZtrLqVDzP6pfkqB?=
 =?iso-8859-1?Q?D49V7wLwDfW/rQRtop3axfE8Okx4ftWD1g+6Ukx1b5gufZ8KmCA84mUP1t?=
 =?iso-8859-1?Q?l0x8ZANnXSUqCEoX/iGUabYoh0R4Yjh/kwzk98h1KzESNrMuNQyOOlZpmi?=
 =?iso-8859-1?Q?vf380HU5AhZ7j6yUKQWmAit2c7qK4wP82Q8+dJ1QAPvQLgP/ULjOYBsQWz?=
 =?iso-8859-1?Q?C5+B003+VO3NPNQKu/JX8v0bgWkgEHzUcPLmYDKoNDhUcVsocSOm9q99Kl?=
 =?iso-8859-1?Q?AjRWskBFWFrp/fmMl0NoJaZDi0QX3+PiXbeSiP9dBDUqfRv/nf2JeAbW42?=
 =?iso-8859-1?Q?HKcPXH4G5YmQICimt3e/MBKZO1A4uuY+88LEzJNzO1Q2uZaNZZX9D6OhSE?=
 =?iso-8859-1?Q?nRYsM7TdFeSgBfs6WMlsAKgZoWamQYtEEnK6ZWYFa2tHGWR7Pm27Vi3WYu?=
 =?iso-8859-1?Q?thbLioGEL6DJhmAkOUfiwxQ3Z+l6FPQlbMhiojjh/BGX2r9g84mhlg5s0J?=
 =?iso-8859-1?Q?h0gEUJ8TX9DSMD3bcSypnkBYY7TabseXOjJe+lqtmj2hqZZq65OTLhJsLu?=
 =?iso-8859-1?Q?pwTc1B/WbLR57MvLgGS0xKAqPfR5XpFBVvHIRdpJbGgoN/DEttOZ4iOvul?=
 =?iso-8859-1?Q?0k1XD2DyHOAxNTLJWHxt4o8dClTtbnWASVMLHZNSoU30Soze/mPb3GD7Nx?=
 =?iso-8859-1?Q?H6dItuZclE0HZK+d+h8gz0IO5t46jnMDLaNb2Ms3SyhArKVnQsoulcTGkL?=
 =?iso-8859-1?Q?MJ0GURmz9ebJoLsFmFqjS+6MDhf8wX/oXb2pTO2JVc4iqCahpA0hElTXKp?=
 =?iso-8859-1?Q?Ubg9TK9uVorHE9VM6ldMnx/RXJb95zUk9nqJbD9tecuN+XeSETKyks22U/?=
 =?iso-8859-1?Q?ZvQmj9C86wnIkrz06qk/X1ieC1mjt1G7qNN6/yoyCuTnQDZ1c+Ib1gggVi?=
 =?iso-8859-1?Q?kDu8crw+91ydj098XJ0Xl/pRGeRL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5C64U/7eWD/OUkxW0311ew50yQNLZhhSOuQLHk90T/i9gvp9u7pdDpMW7u?=
 =?iso-8859-1?Q?8AQXe6DDCMsc4jDkdHZhSabTo030NuC+FpqoDryQiBBJjCZP5qeqJBMAs8?=
 =?iso-8859-1?Q?1/6JxpMl1J+qLlCYPBdJBuNkNBWxcfdYV65eR6Uz81EsiPCfdBkHfzcW/n?=
 =?iso-8859-1?Q?WyQQbYxjiy5+9hEaxHhisKbmjS6ZGf5x7ygU6E2V6AMUKlWqAzaAwfrPdq?=
 =?iso-8859-1?Q?hYI/EmPu0e8nkGWqqBEog+S8Sz4wsMWmk/oWZZRAYp1ULx4Q68wOD0pk40?=
 =?iso-8859-1?Q?G+Gvzu5LDaO0DMLWxoqocarNW6VADNPL+84zHdnEfnjcl6vbwQJUj4In52?=
 =?iso-8859-1?Q?zWB6YkzazpUqlsp5neCmNRq/sjK4MumHr1K4ToQKUtreKX8zZe8+PIndXF?=
 =?iso-8859-1?Q?EHrYsenedFQmZO0JIhX4s2IHtIEnSvP/FdF1LGc1xkTE0ljGMRYupnH9oV?=
 =?iso-8859-1?Q?sC29SUram4FilqtryqHK+ZqHOEl/vOnzqBnbZHAr4ViKItu94UL4QZJLye?=
 =?iso-8859-1?Q?hVrVE3m06BfxLXpcxUt1GwU8PO1TUyNC7QtBCcx+++FlWSFlv07q/l12v5?=
 =?iso-8859-1?Q?QAnRRONJcTWLDMSamf/6Z5NPrFzMt2jjPh45wXg65BYDQHGdsdzrylgJ4I?=
 =?iso-8859-1?Q?U9DEJDRDuruNCf0erOFftxDgQQLLBVym3h87z5tBIaDbzSJcVihwJSWJ2h?=
 =?iso-8859-1?Q?u7Q/cSzLiUQGLPGwRXM94mpc+87ep62PB2mbbZBD26LLS2O2+bSQStiaNp?=
 =?iso-8859-1?Q?4CcLex+ClKg/0oOYoaX3yg/m8z9ODInoE1Nr5GtIVyBbVPN9m2d9Qec9Za?=
 =?iso-8859-1?Q?92TfcxNTA0UO1h+JviCIQevsGMiATcvN94pP76TR5sO1Jm84uzFe4LUp0S?=
 =?iso-8859-1?Q?wd1AnhSxKZBOT49OhSER/JQNZfDrKVpCRsZ3QrnToppS7mIFB8w9LAe2M0?=
 =?iso-8859-1?Q?Y0if+5aXDSDBpDv/kyi78hoP708J9adqgscIpD0sfdbPbPNN9QQ95q8N17?=
 =?iso-8859-1?Q?6DS28JsrdImu77EEF7A4vSj/BJ1h3xIYwfXyb0fJV9ZRQwQ1Wy2tfw1nTS?=
 =?iso-8859-1?Q?VmwQu7bzS9RjL411mv3w/HHALcnjO7XeDrtNCY+v4zc6hjcaGp9KcOVoUG?=
 =?iso-8859-1?Q?PW87UOAE5l5KgnyFFW9Pgc1uW0RjeTqKr90WhtIZBgCd6b7Q2sGJDPgsOl?=
 =?iso-8859-1?Q?ZnOfB4N6fgzNpffEVGLl+TNz73CPkTLIhxFqhXVgGk+YG8xN5y/Zl9GUpr?=
 =?iso-8859-1?Q?z1WinZ+2+dYMSGi2h7Z4aX3O3imcb6LBEbdpsaVc8L43f0R2/bCfzMX6RE?=
 =?iso-8859-1?Q?fttUQWDYH5ih0y87mSQQzUgBvpJTa7UvRNOtXzLV7h6rmkglXwKPtZiGaX?=
 =?iso-8859-1?Q?kXWJA6gW8qyyYBXEXemCsPBMGiISXUeA87OuVqsAueJjwAOGeTjmJOeEHi?=
 =?iso-8859-1?Q?ONANPFtIjjgYY8/w+2xcNomKoYbL+mn8wyCASJPmLoJhdmhHw+o+JZcfPa?=
 =?iso-8859-1?Q?0cBfLwP6C8DMifbZ6dD5iuIICrjL2+tNzXJcRtmnZBL6VIWl3IggazKtmX?=
 =?iso-8859-1?Q?7B1o0w2UDr06KalbgifcbKL43OhsaqOBZBnOyFl2w0JgIxbCVi3xtgV1s8?=
 =?iso-8859-1?Q?jL303LMXj34Y2bwj19TUX4JBXvfMQ3yUKq?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427033189B320D24333100A98D7ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0600a9a-e38b-46ad-0ae5-08de27adc2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 20:53:58.2479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2loE7eU5mOYJs+D8JyB5lV3OOjgVFAhMv/Qr0WPxoXuuVAlxCi0y3NxCagH/kMJDEHnN+pug7wQHX5m5KQUpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
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

--_000_CH0PR11MB5427033189B320D24333100A98D7ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Tuesday, November 18, 2025 11:15 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Badrappa=
n, Jeevaka <jeevaka.badrappan@intel.com>; Kempczynski, Zbigniew <zbigniew.k=
empczynski@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: Add proper che=
cks as R/W not supported simaltaneously

Hi S,
On 2025-10-30 at 20:54:03 +0530, S Sebinraj wrote:
> Add conditions properly for Read and write operations as they are not
> supported simaltaneously, since a file-pointer once opened in read
> mode, cannot be used for write, the same goes vice-versa.
>
> Error: set_frequency:
>        Assertion `fprintf(freq_info->filp, "%d", val) > 0' failed.

> imho it could work if options will break down, first reading/parsing,
> then acting on options one after another. Or checking if there are
> read and write and opening in proper mode beforehand.

> Regards,
> Kamil

Hi, when I checked the same, get, set inorder or vice-versa, it
doesn't seem to work and it throws assertion error. I did find
a solution for the same and will share the same in v3

Regards,
Sebin

>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tools/intel_gpu_frequency.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index de0c6ddba..3378f3927 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -155,6 +155,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t =
act_upon_n, int *new_freq)
>  {
>        int c, tmp;
>        bool write =3D false;
> +     bool reader =3D false;
>
>        /* No args means -g" */
>        if (argc =3D=3D 1) {
> @@ -182,13 +183,17 @@ parse(int argc, char *argv[], bool *act_upon, size_=
t act_upon_n, int *new_freq)
>
>                switch (c) {
>                case 'g':
> -                     if (write =3D=3D true)
> -                             fprintf(stderr, "Read and write operations =
not support simultaneously.\n");
> +                     if (write =3D=3D true) {
> +                             fprintf(stderr,
> +                                     "Read and write operations not supp=
ort simultaneously.\n");
> +                             exit(EXIT_FAILURE);
> +                     }
>                        {
>                                int i;
>                                for (i =3D 0; i < act_upon_n; i++)
>                                        act_upon[i] =3D true;
>                        }
> +                     reader =3D true;
>                        break;
>                case 's':
>                        if (!optarg)
> @@ -199,6 +204,12 @@ parse(int argc, char *argv[], bool *act_upon, size_t=
 act_upon_n, int *new_freq)
>                                exit(EXIT_FAILURE);
>                        }
>
> +                     if (reader =3D=3D true) {
> +                             fprintf(stderr,
> +                                     "Read and write operations not supp=
ort simultaneously.\n");
> +                             exit(EXIT_FAILURE);
> +                     }
> +
>                        write =3D true;
>                        act_upon[MIN] =3D true;
>                        act_upon[MAX] =3D true;
> --
> 2.43.0
>

--_000_CH0PR11MB5427033189B320D24333100A98D7ACH0PR11MB5427namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Tuesday, November 18, 2025 11:15 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel.com&gt;; Kempczyns=
ki, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;; Konieczny, Kamil &lt;k=
amil.konieczny@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: Ad=
d proper checks as R/W not supported simaltaneously
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S,<br>
On 2025-10-30 at 20:54:03 +0530, S Sebinraj wrote:<br>
&gt; Add conditions properly for Read and write operations as they are not<=
br>
&gt; supported simaltaneously, since a file-pointer once opened in read<br>
&gt; mode, cannot be used for write, the same goes vice-versa.<br>
&gt;<br>
&gt; Error: set_frequency:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Assertion `fprintf(freq_info=
-&gt;filp, &quot;%d&quot;, val) &gt; 0' failed.<br>
<br>
&gt; imho it could work if options will break down, first reading/parsing,<=
br>
&gt; then acting on options one after another. Or checking if there are<br>
&gt; read and write and opening in proper mode beforehand.<br>
<br>
&gt; Regards,<br>
&gt; Kamil<br>
<br>
<span style=3D"color: rgb(0, 0, 0);">Hi, when I checked the same, get, set =
inorder or vice-versa, it</span></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">doesn't seem to work and it throws assertion&nbsp;error. I did find</div=
>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">a solution for the same and will share the same in v3</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Regards,</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Sebin</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tools/intel_gpu_frequency.c | 15 +++++++++++++--<br>
&gt;&nbsp; 1 file changed, 13 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c=
<br>
&gt; index de0c6ddba..3378f3927 100644<br>
&gt; --- a/tools/intel_gpu_frequency.c<br>
&gt; +++ b/tools/intel_gpu_frequency.c<br>
&gt; @@ -155,6 +155,7 @@ parse(int argc, char *argv[], bool *act_upon, size=
_t act_upon_n, int *new_freq)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int c, tmp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool write =3D false;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool reader =3D false;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* No args means -g&quot; */=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (argc =3D=3D 1) {<br>
&gt; @@ -182,13 +183,17 @@ parse(int argc, char *argv[], bool *act_upon, si=
ze_t act_upon_n, int *new_freq)<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; switch (c) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case 'g':<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write =3D=3D true)<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;Read and write operations no=
t support simultaneously.\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write =3D=3D true) =
{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;Read and write operations not support simultaneously.\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; act_upon_n; i=
++)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; act_upon[i] =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reader =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; case 's':<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!op=
targ)<br>
&gt; @@ -199,6 +204,12 @@ parse(int argc, char *argv[], bool *act_upon, siz=
e_t act_upon_n, int *new_freq)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (reader =3D=3D true)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &q=
uot;Read and write operations not support simultaneously.\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; exit(EXIT_FAILURE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write =
=3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_upo=
n[MIN] =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; act_upo=
n[MAX] =3D true;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB5427033189B320D24333100A98D7ACH0PR11MB5427namp_--
