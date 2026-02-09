Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528B4EF071B
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 07:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3F010E304;
	Mon,  9 Feb 2026 07:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BS9f0awa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8E10E304
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770621236; x=1802157236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=W7oNCoHnmMnX276OhUfVxAdvVXkPfqjzdFtMAOudy2c=;
 b=BS9f0awajap+fhMBD0ZVorB2/loCdCfAYO/e+tgJ5etT8nLfqC1tN3ys
 bdUl2PnSjRW4duNacUBHH8J7RYfZgVr5fjYZMogHM5VBkHdaWPA5o2YpN
 ltYZqw/7zWjiJdmpxm66ZAeJsn0Gi3otTR5NQy+ocZXOntQtpzbbEf+0m
 cWb2N7KDjPhbJiNUJnKgObwBF9rj4Ip7qigqGUF+Bylvm8z43Ufr62U5m
 h+rNhKYZw3Pdwg/5jn2NyjEs9SG8OYq8ix3Kj/MRZlHP6X2OmGxd55Jqm
 EsK3Uf/eGCUJCU7I4roMGvtUxf+16Wh2518qrPExUhkLgh6hED1wHRoG5 w==;
X-CSE-ConnectionGUID: +sybaqciS9acTgCbZnCrfg==
X-CSE-MsgGUID: KX2kp6Q/R/izzo2qTCfBlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71910611"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208,217";a="71910611"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 23:13:56 -0800
X-CSE-ConnectionGUID: 62YNxtFVROK5gy3L3W+DQg==
X-CSE-MsgGUID: 8wWkdOKSQD2VfWAcC8lbrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; 
 d="scan'208,217";a="242132147"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2026 23:13:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 23:13:55 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 8 Feb 2026 23:13:55 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 8 Feb 2026 23:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8vfErxIiJlFWwcooEL2JTEULeyZdASQHhLqKTWnAleKNjgV0KowevJHpx3aQULl6igHCO34K+TW778KObTtn+p5lU/Yk+8nHtneP+7gYVjjsbQ4QuvO6+C0/tOm5uyPDotGYpCdwuavl+DvyC9WHb1h2q42Sqr9OQXmYzcgyrtXkEtCreatD9JgeLXxQM/SYqs2sffqSFh4RzgBw94TnRegY0jrhkQ7CSIxFbkkSS9EACtLK3MnIuGGYInw34tqAFBEzUVp+RYqps7joa9gk74+fFffI4vLl8INMp2WL3cBf5Wuak2UsYKI8gKEgZiNhbvKY7RYqS8ki7s8q/++WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5iblEMDTloZnQG6Sn0ot24lIE6BzhvcL7Wvo3D0ooU=;
 b=u0cHX1d8AunlkzreWhsT3axAmZZH7E2jvzZ1mbwaEryOJJ23QuXzMPTWGii32SvWOowSDWNNS7rsiy+RoTgTfDhEal3aIIM9qw633tu7B8Th+NMr/nObX9m81asceV4K2uJU2JDZkH3VaXGBAWuHKzk5SW/peR2MTCQquAhlr1+DNCdy6tHjJtXVSBpwzNzsvLe4AQcY81uR5Gwu2HWxuBOt64G63wga02WzHxHj2/3gZrrvOxNeeSNUmMqVDR6qGNOB+KFWd2n2UydHF5LwLBD4XX1YKtQZq6Thzeyrt3zEYy500dFbAyX9PsDjI7Fpuj6aw2RgFzk08MlUB/0iIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 07:13:51 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9587.016; Mon, 9 Feb 2026
 07:13:50 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Santa, Carlos" <carlos.santa@intel.com>, "Badrappan, Jeevaka"
 <jeevaka.badrappan@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Topic: [PATCH i-g-t v2] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Index: AQHcip2rGcDssJeU+Eux2abG9OBM77V1MhuAgATewHA=
Date: Mon, 9 Feb 2026 07:13:50 +0000
Message-ID: <CH0PR11MB5427281EA2CF49992FCEEBEB9865A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260121060909.2467562-1-s.sebinraj@intel.com>
 <a3f52916-c20d-41ab-8455-3a26ee40ed52@intel.com>
In-Reply-To: <a3f52916-c20d-41ab-8455-3a26ee40ed52@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|CY5PR11MB6415:EE_
x-ms-office365-filtering-correlation-id: a49b67cd-1e1d-493b-649c-08de67aac6b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|8096899003|13003099007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ULF4Td/uJcdGJn1IRPk1CNJM2RA+H7ZL7mZ7O4d7VMnr9kdujavElOJeFU?=
 =?iso-8859-1?Q?Z2eV0+Bpu/MIY7vmUCJlAD0jXBdlbnfLRfB1+iwh+oRU2emTrrPHMhNgEU?=
 =?iso-8859-1?Q?UMzwsBPaGJN33WBO8VhpWPPQRG0WlJYnszpKPf4ZlTCI1ThNKVgR+g4JwF?=
 =?iso-8859-1?Q?ayQURuBIlQrbUd8jKQx5o8Cpw3DW4PIRVso5Hm0KvqnqQ0W8EVjkWnlZc0?=
 =?iso-8859-1?Q?V5ok37RD9wT/q8X4ykvYP3eA6Wfl8RXJqn0KEs8aGdPGEeV30FEdQm90HV?=
 =?iso-8859-1?Q?NIelzf9UYJwxeqLwGGJk1Dqff5GMIN2v+gx0aPTJgg1eFZSR9u5+5OKpcw?=
 =?iso-8859-1?Q?5yOZwu+XUN30Zd/gaqBhNo3VftyyGcvv1IwFwAcsUPuDv/u0VYBsX3uzf2?=
 =?iso-8859-1?Q?HaRjHOjp8F5qQcTR40SuRkRHCXX8P8MibDne4yCcQ7NXQcQaPLSfjrSsdx?=
 =?iso-8859-1?Q?22Z2xPGQQgDoN7BVEbkfMJP2YKmw1oJSsT9RJkGT292Ndf5tScbeF0i8yI?=
 =?iso-8859-1?Q?n1Et3YP7Tb8tQCOHmVL3TpD/E1gj1sS2KYMrCdXWkyOxrd0qSjSHhZyT9d?=
 =?iso-8859-1?Q?TuKCC6JftiHPV31NDxlxcfO1oO402q5pBPEJfV6VSrqV9Lerp13vlBK4Hc?=
 =?iso-8859-1?Q?/p474cx6NWIw+Z/RMPtmWVSr+5rEVdYoNYhVJqeOXl58/wa8M6F35g0Fin?=
 =?iso-8859-1?Q?Py/J5pMGYVPmZcuumPqIJpRK9F0PwcwujylpVJuPmwbjlNTZB2zcr6pI1n?=
 =?iso-8859-1?Q?uy7YKkdd4NtzvewD1Gh8L3UWOJSsYEA/gSxEV7e3VVZ0K3Gjzq9XTZfKDU?=
 =?iso-8859-1?Q?uXr5c48YhCIyE5Oyqf70USd8H+fxxZjAEUJY6ZGG47Ou6CnImVBR+qjpTa?=
 =?iso-8859-1?Q?5Q3go4Aj9EYO66LrYpUKTZQYUw+lLhk7NNgiy0pKpLw9k0M3+OkFnZENQy?=
 =?iso-8859-1?Q?rmEbkmOHsahJ51nzA5LPmWZ10DOT9D90y3gMmqEvtF+3L6sRb4tqdj1kfL?=
 =?iso-8859-1?Q?59eguAFApJvD1vK0bN9H22a+M5upmBAqYvDUFBIlR2SJk9/Ptynk9gtE1k?=
 =?iso-8859-1?Q?zRReVygE3sz31/2wPC5CDgdmhQgkVrMxucV51CDKS6ZR3Pi4N40g3Txp+P?=
 =?iso-8859-1?Q?JcGYtOD/z0UOOK+HKQ6Sez9F07OLRxCCKyJs2poOWCukR0ggM1tUtksiVH?=
 =?iso-8859-1?Q?t8qiG4P78et9EKa54p2/7BC6toV3W0MNtzZFpGE4X3mj112nhJFd0OU1aI?=
 =?iso-8859-1?Q?Q2fQTw1KHXBDmbD6xrmQ6b1A7AQSyGxC26XwjfAu9VYkQIpNqY8F5zIy8s?=
 =?iso-8859-1?Q?zf3L/+IVOUvlKzUHfezo4+STR6UFYEGxDAhhNwFIsw6r3XnAv8/KXTNy5N?=
 =?iso-8859-1?Q?nkblukVQqWjjKhUii4m5YYg4L0O2hfxX3Ms6swVBlsUO2+N49wKnGC39Rt?=
 =?iso-8859-1?Q?te0sb2uxcrpMDG9CJVN8k86YU61jjnXNvhAi/BB/OGfzLo9HotEUetfF6S?=
 =?iso-8859-1?Q?IrT6P8fkKeqOvgPp0yTd8Pa010dbvJzsr03ZptZgnMp7jtraw/LGGS3HiI?=
 =?iso-8859-1?Q?+td/yhEoxbB0mi3JNGZNaAKay4t8RyhTP1DIg9BLhHsnmSC4OFS7HsKr1v?=
 =?iso-8859-1?Q?oZeZnp0t5RqFqbH1cpD7I7UZspJgxojncx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?I0UEJRu86N+7AWj+sdbIcG1iFh5cRF1KREenQ9zQEnCgsEbiAtfu/UOzgQ?=
 =?iso-8859-1?Q?0ynwsWuv7Bxg2ZYphaoM80Xw/Pz41S399twMX5mwJVXYFYVhCpVUpdrpV9?=
 =?iso-8859-1?Q?nR9BjynJK16XyXDk5bj2pbFF7FiFUx2l+oEKmEFvrCr2H/FD0ZuodO2/t7?=
 =?iso-8859-1?Q?uFL3r29b6t5KJG36WTDkMV0hOgwja+mzvcrezOpyozmFs239Sqi55SBezZ?=
 =?iso-8859-1?Q?1DifDmkZSUV+rV3zCERrZYwc+a1YIlI4a8ukOkLNDozzC6lpyfZ39Co+zM?=
 =?iso-8859-1?Q?3LuD66j6whU8iSENcMzy1Gsubq2J+nQ23Y0MU9XneUTg4Rn+X8aINKTl7l?=
 =?iso-8859-1?Q?pppXOOsnUgn+PspIUQmZfoHQR8drhdUnRfNF0WbcDZ+8ezWqy1HDecXxAU?=
 =?iso-8859-1?Q?VogGS3eFLZhcd2691loYe4k7PWbnc07WgxXAktCgs/9G46Eq03viZQg96q?=
 =?iso-8859-1?Q?0jwvVg6t9ZaWtub/6lqQIiWmjh2CaTkA9k1SJzw3J9VAqssIwi7mj4i4rF?=
 =?iso-8859-1?Q?ygIKO1laDQZ6Gc9EPZcnJ3RJlTqJQSVTcMtDYHvU4m9YXWCu7TPJ3J2ej3?=
 =?iso-8859-1?Q?o3Tj8Z6z/VwKmV8WhG76w8lIXveUbGEIgNJT+n7Wr1NaB6Wa34rZMIeBq1?=
 =?iso-8859-1?Q?rQzgNsjuMiKZyg3dP2Yd5SvsEdYdpieD/tqSd9ywYvqyXIyFiR/YEuvMDH?=
 =?iso-8859-1?Q?1rT7NvsbLnXevbGqVg65I45l16l4FAt9T0KelGOSUq1G8YM7VPw/mMisOy?=
 =?iso-8859-1?Q?UD8d1TADLP2dD/+YSBl9lXFrJHS7l5/QG+BL1ibaA066106bV4Drv0n+Ia?=
 =?iso-8859-1?Q?fuk7xtlcoqXyj0StDe16ZUzruWAKgH7lvidpEbpRadf5fj2NXp5lbUIXQe?=
 =?iso-8859-1?Q?UaNW9JqQ+DU5JbXqilDLvWCkPIIKOfVOOk0WdyjJcjEiByl5GcZ1rp8TPO?=
 =?iso-8859-1?Q?mq0afaZIq7CrPehI0NryfbejS/4LMQn7+vo0Knqgk3zhTqVTFVPvnFSlDZ?=
 =?iso-8859-1?Q?vYjSGR4gzPlAlUAMcPq9/4tbHLMy7W/WIIe0dkzo+9L8ccpl9HvsjUQ2xj?=
 =?iso-8859-1?Q?XVKDtX3X+OCZSd2eGP0M+CFI4ib4ySoN27ZJUITfA3R9OGREHX7W5Nq4FA?=
 =?iso-8859-1?Q?ThuXQPjr7itaDboLNdV/lPbdqd+aCVFNGv9isHhCABSDAQjhMuD/FuoP0Y?=
 =?iso-8859-1?Q?uqHHPq7VBrLBPP3aWlqWH4Y7Yjj/cwXIw8ORtdDUblrRCE1cH3ZPeNP6hJ?=
 =?iso-8859-1?Q?01poXVrz9a7oPY/YB7UwTwUGQJQc+AZtLaRO2PviEbjFz1uRepfqN+skEM?=
 =?iso-8859-1?Q?IMJhi13Do5Zh5Ve/yBQivaqj7oLVUKVKdrcKl5zsAk5a6zHHhWl678PlZB?=
 =?iso-8859-1?Q?tqRLzCyL2X/Gt++a8Ndt7x+GXC7X/ounWDp4rAGPTa+3nQQ7boyF19gwRV?=
 =?iso-8859-1?Q?UV+O6OIFMDBVlz6N8+TiMAxS1KvHIxc1UGANxRyu+XI1p8MesgUPvd5BIp?=
 =?iso-8859-1?Q?+BS8lPRAvUCaBWTnFn+zplciMNH5ZG7ya0qgk4y6e9yvpG4zBlwMG5OorS?=
 =?iso-8859-1?Q?6OLn4DQDVUgzebke/dB5EllkBcWIOk6bv9lySsTCSCpwz3DL3T7sp0sWjO?=
 =?iso-8859-1?Q?ATjsqeY3ymxAGoNnmbHd4+Eu/VhLEfFvLiFSft2ddYKrdzQhfQyEm4CgbL?=
 =?iso-8859-1?Q?rPosntrM3Q/H6IeiPU/CT7k/LWaqfgy5Wmx1hq/WoSBfohc7Sabz1TTJhI?=
 =?iso-8859-1?Q?+Ucgz6ausYM8mhn1LPwWQ+uo33cxAvQTvm4mEIUyCNlpSK?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427281EA2CF49992FCEEBEB9865ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49b67cd-1e1d-493b-649c-08de67aac6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 07:13:50.8642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rGoeHbD8AwjIv3KsJwD8J1wrf5eQiT+v7cp2wxgw6KsyIo3YmKvDVbi6GXnn8awi9FTVTt2aIGy+Fewc+1NP+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
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

--_000_CH0PR11MB5427281EA2CF49992FCEEBEB9865ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________

On 1/21/2026 11:39 AM, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>     - Primary plane:   signaled fence (simulating completed GPU work)
>     - Overlay-1 plane: signaled fence (simulating completed GPU work)
>     - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>   - Planes with signaled fences update prematurely before unsignaled
>     fences complete, breaking atomic commit semantics
>   - Fence states are mismanaged across multiple planes causing visual
>     glitches or corruption
>   - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
>    of explicit fences when provided two or more buffers at once,
>    with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>    https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>    use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Changes:
> -v2
>    - Add crc check instead of visual inspection
>    - Reduce debug logging which are not needed
>    - Add a function for initial modset
>    - Make test not specific to Intel drivers alone
>    - Sort the included libs in alphabetical order
>    - Modify set_output func as we want only one
>      output per pipe
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   tests/kms_explicit_fence.c | 356 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 357 insertions(+)
>   create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..774f49c4a
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2026 Intel Corporation
>> License format is still not right, Please check.

Okay, I'll correct it as per reference.

> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fen=
ce states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple=
 planes
> + * are updated in a single atomic commit with different fence states. Th=
is is
> + * critical for catching fence synchronization bugs where the driver mig=
ht:
> + * 1. Prematurely display buffers with signaled fences before unsignaled=
 fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitc=
hes
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include <errno.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence st=
ates:
> + *              2 planes with signaled fences and 1 plane with unsignale=
d fence.
> + *              Validates that display waits for all fences before updat=
ing any plane.
> + */
> +
> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT (NUM_PLANES - 1)
> +
> +#define FENCE_TIMEOUT_MS 2000
> +
> +#define OVERLAY_SIZE_DIVISOR 3
> +#define OVERLAY1_POS_X 100
> +#define OVERLAY1_POS_Y 100
> +#define OVERLAY2_OFFSET 100
> +
> +typedef struct {
> +     int drm_fd;
> +     igt_display_t display;
> +     igt_output_t *output;
> +     enum pipe pipe;
> +     igt_plane_t *primary;
> +     igt_plane_t *overlay1;
> +     igt_plane_t *overlay2;
> +     struct igt_fb primary_fb;
> +     struct igt_fb overlay1_fb;
> +     struct igt_fb overlay2_fb;
> +     drmModeModeInfo *mode;
> +     int width, height;
> +     igt_pipe_crc_t *pipe_crc;
> +} data_t;
> +
> +static void setup_output(data_t *data)
> +{
> +     igt_display_t *display =3D &data->display;
> +     igt_output_t *output;
> +     enum pipe pipe;
> +
> +     for_each_pipe_with_single_output(display, pipe, output) {
> +             data->primary =3D igt_pipe_get_plane_type(
> +                     igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PR=
IMARY);
> +             data->overlay1 =3D igt_pipe_get_plane_type_index(
> +                     igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OV=
ERLAY, 0);
> +             data->overlay2 =3D igt_pipe_get_plane_type_index(
> +                     igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OV=
ERLAY, 1);

>> Please fix the styling here. "OPEN_ENDED_LINE: Lines should not end with
a '(' "

Okay, got it, I'll correct these.

> +
> +             /* We need at least OVERLAY_COUNT overlay planes for this t=
est */
> +             if (data->overlay1 && data->overlay2) {
> +                     data->output =3D output;
> +                     data->pipe =3D pipe;
> +                     data->mode =3D igt_output_get_mode(output);
> +                     data->width =3D data->mode->hdisplay;
> +                     data->height =3D data->mode->vdisplay;
> +                     return;
> +             }
> +     }
> +
> +     igt_skip("Need at least %d overlay planes for this test\n", OVERLAY=
_COUNT);
> +}
> +
> +static void cleanup_crtc(data_t *data)
> +{
> +     igt_display_reset(&data->display);
> +
> +     igt_remove_fb(data->drm_fd, &data->primary_fb);
> +     igt_remove_fb(data->drm_fd, &data->overlay1_fb);
> +     igt_remove_fb(data->drm_fd, &data->overlay2_fb);
> +}
> +
> +static void create_fbs(data_t *data)
> +{
> +     int overlay_width =3D data->width / OVERLAY_SIZE_DIVISOR;
> +     int overlay_height =3D data->height / OVERLAY_SIZE_DIVISOR;
> +
> +     /* Primary plane - Blue background */
> +     igt_create_color_fb(data->drm_fd, data->width, data->height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         0.0, 0.0, 1.0, /* Blue */
> +                         &data->primary_fb);
> +
> +     /* Overlay 1 - Red square */
> +     igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         1.0, 0.0, 0.0, /* Red */
> +                         &data->overlay1_fb);
> +
> +     /* Overlay 2 - Green square */
> +     igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +                         DRM_FORMAT_XRGB8888,
> +                         DRM_FORMAT_MOD_LINEAR,
> +                         0.0, 1.0, 0.0, /* Green */
> +                         &data->overlay2_fb);
> +}
> +
> +static void setup_initial_modeset(data_t *data)
> +{
> +     /* Initial modeset to establish baseline (no fences) */
> +     igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display,=
 data->pipe));
> +     igt_plane_set_fb(data->primary, &data->primary_fb);
> +     igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +     igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS=
_Y);
> +     igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +     igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSE=
T -
> +                             data->overlay2_fb.width, OVERLAY1_POS_Y);
> +     igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/**
> + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence st=
ates
> + *
> + * This test reproduces the critical scenario where multiple planes are =
updated
> + * in a single atomic commit with different fence states. The key valida=
tion is
> + * that the display does NOT update any plane until ALL fences are signa=
led.
> + *
> + * Test setup:
> + * - Primary plane: buffer with a signaled fence (already retired)
> + * - Overlay 1 plane: buffer with a signaled fence (already retired)
> + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running oper=
ation)
> + *
> + * Expected behavior:
> + * - Atomic commit succeeds immediately (non-blocking)
> + * - Display waits internally for ALL fences before updating
> + * - No plane shows its new buffer until the unsignaled fence completes
> + * - After signaling the last fence, all planes update atomically
> + *
> + * Bug detection:
> + * If the driver has a bug, it will either:
> + * 1. Show the primary and overlay1 buffers prematurely (before overlay2=
's fence signals)
> + * 2. Cause visual glitches from fence mismanagement
> + * 3. Fail the atomic commit
> + */
> +static void multiplane_atomic_fence_wait(data_t *data)
> +{
> +     int timelines[NUM_PLANES];
> +     int fences[NUM_PLANES];
> +     int ret;
> +     int out_fence;
> +     igt_plane_t *planes[NUM_PLANES];
> +     bool should_signal[NUM_PLANES] =3D { true, true, false };
> +     igt_crc_t crc_before, crc_after;
> +
> +     igt_require_sw_sync();
> +
> +     setup_initial_modeset(data);
> +
> +     /* Setup arrays for loop-based processing */
> +     planes[PLANE_PRIMARY_IDX] =3D data->primary;
> +     planes[PLANE_OVERLAY1_IDX] =3D data->overlay1;
> +     planes[PLANE_OVERLAY2_IDX] =3D data->overlay2;
> +
> +     /* Start CRC capture to verify no premature display updates */
> +     igt_pipe_crc_start(data->pipe_crc);
> +     igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_before)=
;
> +
> +     /* Create timelines and fences for all planes */
> +     for (int i =3D 0; i < NUM_PLANES; i++) {
> +             /* Create timeline */
> +             timelines[i] =3D sw_sync_timeline_create();
> +             igt_assert(timelines[i] >=3D 0);
> +
> +             /* Create fence at sequence 1 */
> +             fences[i] =3D sw_sync_timeline_create_fence(timelines[i], 1=
);
> +             igt_assert(fences[i] >=3D 0);
> +
> +             /* Signal fence (first 2 planes) */
> +             if (should_signal[i]) {
> +                     sw_sync_timeline_inc(timelines[i], 1);
> +                     igt_assert_eq(sync_fence_status(fences[i]), 1);
> +             } else {
> +                     /* Do not signal this fence yet, 3rd plane */
> +                     igt_assert_eq(sync_fence_status(fences[i]), 0);
> +             }
> +
> +             /* Attach IN_FENCE_FD to plane */
> +             igt_plane_set_fence_fd(planes[i], fences[i]);
> +     }
> +
> +     /* Swap overlay colors to detect scanout changes via CRC */
> +     igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +     igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS=
_Y);
> +     igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +     igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSE=
T -
> +                             data->overlay1_fb.width, OVERLAY1_POS_Y);
> +
> +     /* Request OUT_FENCE to track when display update completes */
> +     igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, data->=
pipe));
> +
> +     /*
> +      * The atomic commit should succeed immediately (NONBLOCK mode),
> +      * but the display should NOT update any plane until ALL fences
> +      * (including the unsignaled overlay2 fence) are signaled.
> +      *
> +      * A buggy driver might:
> +      * - Show primary and overlay1 immediately
> +      * - Cause visual corruption
> +      * - Fail the commit
> +      */
> +     ret =3D igt_display_try_commit_atomic(&data->display,
> +                                         DRM_MODE_ATOMIC_NONBLOCK,
> +                                         NULL);
> +     igt_assert_eq(ret, 0);
> +
> +     /* Get the out fence to monitor completion */
> +     out_fence =3D igt_crtc_for_pipe(&data->display, data->pipe)->out_fe=
nce_fd;
> +     igt_assert(out_fence >=3D 0);
> +
> +     /* Verify overlay2 fence (last one) is still unsignaled */
> +     igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +
> +     /* Verify out fence is also unsignaled (display hasn't updated yet)=
 */
> +     ret =3D sync_fence_status(out_fence);
> +     igt_assert_f(ret !=3D 1,
> +                  "OUT_FENCE already signaled while overlay2 fence is un=
signaled - "
> +                  "driver did not wait for all IN_FENCEs!");
> +
> +     /*
> +      * Wait briefly and verify display hasn't updated via CRC check.
> +      * In a buggy implementation, the display might update prematurely.
> +      */
> +     usleep(100000); /* 100ms */
> +
> +     /* Check if out fence signaled prematurely */
> +     ret =3D sync_fence_status(out_fence);
> +     igt_assert_f(ret !=3D 1,
> +                  "OUT_FENCE signaled before overlay2 fence - "
> +                  "driver updated display without waiting for all fences=
");
> +
> +     /* CRC verify - check if display has not updated prematurely */
> +     igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_after);
> +     igt_assert_crc_equal(&crc_before, &crc_after);
> +
> +     /* Now signal the blocking fence (overlay2) */
> +     sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
> +
> +     /* Wait for overlay2 fence to be signaled */
> +     ret =3D sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_M=
S);
> +     igt_assert_eq(ret, 0);
> +     igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
> +
> +     /* Now wait for the display update to complete (out fence signals) =
*/
> +     ret =3D sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
> +     igt_assert_eq(ret, 0);
> +     igt_assert_eq(sync_fence_status(out_fence), 1);
>> One more CRC check required here?

You are right, I'll add that.

> +
> +     igt_pipe_crc_stop(data->pipe_crc);
> +
> +     /* Cleanup */
> +     for (int i =3D 0; i < NUM_PLANES; i++) {
> +             close(fences[i]);
> +             close(timelines[i]);
> +             igt_plane_set_fence_fd(planes[i], -1);
> +     }
> +     close(out_fence);
> +     igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd =3D -1;
> +}
> +
> +static void reset_display_state(data_t *data)
> +{
> +     igt_plane_set_fb(data->primary, NULL);
> +     igt_plane_set_fb(data->overlay1, NULL);
> +     igt_plane_set_fb(data->overlay2, NULL);
> +     igt_output_set_crtc(data->output, NULL);
> +     igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +int igt_main()
> +{
> +     data_t data =3D {};
> +
> +     igt_fixture() {
> +             data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +             kmstest_set_vt_graphics_mode();
> +             igt_display_require(&data.display, data.drm_fd);
> +             igt_display_require_output(&data.display);
> +
> +             setup_output(&data);
> +             create_fbs(&data);
> +
> +             data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.pipe,
> +                                              IGT_PIPE_CRC_SOURCE_AUTO);
> +     }
> +
> +     igt_describe("Test atomic commit with 3 planes (1 primary, 2 overla=
y) "
> +                  "where 2 planes have signaled fences and 1 plane has a=
n "
> +                  "unsignaled fence. Validates that display does not upd=
ate "
> +                  "any plane until all fences are signaled, catching bug=
s "

>> IMHO, the part of describe after this redundant. May be we can stop it
at 'signaled'?

>> Thanks and Regards,
>> Karthik.B.S

Okay got it.

Thanks,
Sebin

> +                  "where drivers might prematurely display buffers or "
> +                  "mismanage fence synchronization across multiple plane=
s.");
> +     igt_subtest("multiplane-atomic-fence-wait")
> +             multiplane_atomic_fence_wait(&data);
> +
> +     igt_fixture() {
> +             reset_display_state(&data);
> +             igt_pipe_crc_free(data.pipe_crc);
> +             cleanup_crtc(&data);
> +             igt_display_fini(&data.display);
> +             drm_close_driver(data.drm_fd);
> +     }
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 0ad728b87..cc356610d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -36,6 +36,7 @@ test_progs =3D [
>        'kms_dither',
>        'kms_display_modes',
>        'kms_dp_aux_dev',
> +     'kms_explicit_fence',
>        'kms_feature_discovery',
>        'kms_flip',
>        'kms_flip_event_leak',

--_000_CH0PR11MB5427281EA2CF49992FCEEBEB9865ACH0PR11MB5427namp_
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
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
On 1/21/2026 11:39 AM, S Sebinraj wrote:<br>
&gt; Add a new test to validate explicit fencing.<br>
&gt; This test handles multiple planes in a single atomic commit.<br>
&gt; This test addresses a critical scenario where drivers must correctly<b=
r>
&gt; synchronize planes with mixed fence states.<br>
&gt;<br>
&gt; Test Scenario:<br>
&gt; - Creates three planes: one primary, two overlay<br>
&gt; - Attaches fences with different states:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Primary plane:&nbsp;&nbsp; signaled fence (s=
imulating completed GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Overlay-1 plane: signaled fence (simulating =
completed GPU work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Overlay-2 plane: unsignaled fence (simulatin=
g long-running GPU job)<br>
&gt; - Submits all planes in a single atomic commit with IN_FENCE_FD set<br=
>
&gt; - Validates that display waits for ALL fences before updating ANY plan=
e<br>
&gt;<br>
&gt; Bug Detection:<br>
&gt; This test catches driver bugs where:<br>
&gt;&nbsp;&nbsp; - Planes with signaled fences update prematurely before un=
signaled<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; fences complete, breaking atomic commit semant=
ics<br>
&gt;&nbsp;&nbsp; - Fence states are mismanaged across multiple planes causi=
ng visual<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; glitches or corruption<br>
&gt;&nbsp;&nbsp; - The driver fails to wait on all IN_FENCE_FDs atomically<=
br>
&gt;<br>
&gt; The test uses sw_sync timelines to create controllable fence states,<b=
r>
&gt; allowing precise validation of fence synchronization behavior. An<br>
&gt; OUT_FENCE_PTR is requested to monitor when the display update actually=
<br>
&gt; completes, enabling detection of premature updates.<br>
&gt;<br>
&gt; Implementation Details:<br>
&gt; - Uses sw_sync for creating fences with controlled signaling<br>
&gt; - Monitors OUT_FENCE to detect premature display updates<br>
&gt; - Validates atomic commit integrity across multiple planes<br>
&gt;<br>
&gt; Background:<br>
&gt; - A bug regressed for Xe driver on PTL (Android) i915/display handling=
<br>
&gt;&nbsp;&nbsp;&nbsp; of explicit fences when provided two or more buffers=
 at once,<br>
&gt;&nbsp;&nbsp;&nbsp; with 1+ already-signaled fences and 1+ not-yet-signa=
led fences.<br>
&gt;&nbsp;&nbsp;&nbsp; <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink"=
 id=3D"OWA2920c0cc-fc1f-8a73-1abe-a83b855c5731" href=3D"https://patchwork.f=
reedesktop.org/patch/662982/">
https://patchwork.freedesktop.org/patch/662982/</a><br>
&gt; - Adding this test so that IGT contains sufficient testing for the<br>
&gt;&nbsp;&nbsp;&nbsp; use of explicit fencing in the KMS Atomic Modesettin=
g APIs.<br>
&gt;<br>
&gt; Changes:<br>
&gt; -v2<br>
&gt;&nbsp;&nbsp;&nbsp; - Add crc check instead of visual inspection<br>
&gt;&nbsp;&nbsp;&nbsp; - Reduce debug logging which are not needed<br>
&gt;&nbsp;&nbsp;&nbsp; - Add a function for initial modset<br>
&gt;&nbsp;&nbsp;&nbsp; - Make test not specific to Intel drivers alone<br>
&gt;&nbsp;&nbsp;&nbsp; - Sort the included libs in alphabetical order<br>
&gt;&nbsp;&nbsp;&nbsp; - Modify set_output func as we want only one<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output per pipe<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; tests/kms_explicit_fence.c | 356 +++++++++++++++++++++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; tests/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp;&nbsp; 2 files changed, 357 insertions(+)<br>
&gt;&nbsp;&nbsp; create mode 100644 tests/kms_explicit_fence.c<br>
&gt;<br>
&gt; diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..774f49c4a<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/kms_explicit_fence.c<br>
&gt; @@ -0,0 +1,356 @@<br>
&gt; +// SPDX-License-Identifier: MIT<br>
&gt; +/*<br>
&gt; + * Copyright =A9 2026 Intel Corporation<br>
&gt;&gt; License format is still not right, Please check.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Okay, I'll correct it as per reference.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a<br>
&gt; + * copy of this software and associated documentation files (the &quo=
t;Software&quot;),<br>
&gt; + * to deal in the Software without restriction, including without lim=
itation<br>
&gt; + * the rights to use, copy, modify, merge, publish, distribute, subli=
cense,<br>
&gt; + * and/or sell copies of the Software, and to permit persons to whom =
the<br>
&gt; + * Software is furnished to do so, subject to the following condition=
s:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice (including t=
he next<br>
&gt; + * paragraph) shall be included in all copies or substantial portions=
 of the<br>
&gt; + * Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO =
EVENT SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING<br>
&gt; + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R DEALINGS<br>
&gt; + * IN THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * TEST: kms explicit fence multiplane<br>
&gt; + * Category: Display<br>
&gt; + * Description: Test explicit fencing with multiple planes and mixed =
fence states<br>
&gt; + * Driver requirement: i915, xe<br>
&gt; + * Mega feature: General Display Features<br>
&gt; + *<br>
&gt; + * This test validates correct handling of explicit fences when multi=
ple planes<br>
&gt; + * are updated in a single atomic commit with different fence states.=
 This is<br>
&gt; + * critical for catching fence synchronization bugs where the driver =
might:<br>
&gt; + * 1. Prematurely display buffers with signaled fences before unsigna=
led fences complete<br>
&gt; + * 2. Mismanage fence states across multiple planes causing visual gl=
itches<br>
&gt; + * 3. Fail to wait on all fences atomically before updating the displ=
ay<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +#include &lt;stdbool.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;sys/eventfd.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;igt.h&quot;<br>
&gt; +#include &quot;igt_aux.h&quot;<br>
&gt; +#include &quot;sw_sync.h&quot;<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * SUBTEST: multiplane-atomic-fence-wait<br>
&gt; + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence=
 states:<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 2 planes with signaled fences and 1 plane with unsignaled fence=
.<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; Validates that display waits for all fences before updating any=
 plane.<br>
&gt; + */<br>
&gt; +<br>
&gt; +/* Test configuration macros */<br>
&gt; +#define NUM_PLANES 3<br>
&gt; +#define PLANE_PRIMARY_IDX 0<br>
&gt; +#define PLANE_OVERLAY1_IDX 1<br>
&gt; +#define PLANE_OVERLAY2_IDX 2<br>
&gt; +#define OVERLAY_COUNT (NUM_PLANES - 1)<br>
&gt; +<br>
&gt; +#define FENCE_TIMEOUT_MS 2000<br>
&gt; +<br>
&gt; +#define OVERLAY_SIZE_DIVISOR 3<br>
&gt; +#define OVERLAY1_POS_X 100<br>
&gt; +#define OVERLAY1_POS_Y 100<br>
&gt; +#define OVERLAY2_OFFSET 100<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int drm_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t display;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *primary;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *overlay1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *overlay2;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb primary_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb overlay1_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct igt_fb overlay2_fb;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drmModeModeInfo *mode;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int width, height;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc;<br>
&gt; +} data_t;<br>
&gt; +<br>
&gt; +static void setup_output(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_single_output(display, pi=
pe, output) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;primary =3D igt_pipe_get_plane_type(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(displ=
ay, pipe), DRM_PLANE_TYPE_PRIMARY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;overlay1 =3D igt_pipe_get_plane_type_index(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(displ=
ay, pipe), DRM_PLANE_TYPE_OVERLAY, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;overlay2 =3D igt_pipe_get_plane_type_index(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(displ=
ay, pipe), DRM_PLANE_TYPE_OVERLAY, 1);<br>
<br>
&gt;&gt; Please fix the styling here. &quot;OPEN_ENDED_LINE: Lines should n=
ot end with<br>
a '(' &quot;<br>
<br>
Okay, got it, I'll correct these.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* We need at least OVERLAY_COUNT overlay planes for this test */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (data-&gt;overlay1 &amp;&amp; data-&gt;overlay2) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;output =3D out=
put;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;pipe =3D pipe;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;mode =3D igt_o=
utput_get_mode(output);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;width =3D data=
-&gt;mode-&gt;hdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;height =3D dat=
a-&gt;mode-&gt;vdisplay;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_skip(&quot;Need at least %d overlay plan=
es for this test\n&quot;, OVERLAY_COUNT);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void cleanup_crtc(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_reset(&amp;data-&gt;display);<br=
>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt=
;primary_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt=
;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_remove_fb(data-&gt;drm_fd, &amp;data-&gt=
;overlay2_fb);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void create_fbs(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int overlay_width =3D data-&gt;width / OVERL=
AY_SIZE_DIVISOR;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int overlay_height =3D data-&gt;height / OVE=
RLAY_SIZE_DIVISOR;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Primary plane - Blue background */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, data-&g=
t;width, data-&gt;height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.0, 0.0, 1.0, /* Blue */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;primary_fb);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Overlay 1 - Red square */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, overlay=
_width, overlay_height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1.0, 0.0, 0.0, /* Red */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;overlay1_fb);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Overlay 2 - Green square */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_create_color_fb(data-&gt;drm_fd, overlay=
_width, overlay_height,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_XRGB8888,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 DRM_FORMAT_MOD_LINEAR,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.0, 1.0, 0.0, /* Green */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &amp;data-&gt;overlay2_fb);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void setup_initial_modeset(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Initial modeset to establish baseline (no=
 fences) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, igt_crt=
c_for_pipe(&amp;data-&gt;display, data-&gt;pipe));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, &amp;data=
-&gt;primary_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, &amp;dat=
a-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1, OV=
ERLAY1_POS_X, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, &amp;dat=
a-&gt;overlay2_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay2, da=
ta-&gt;width - OVERLAY2_OFFSET -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay2_fb.width, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, C=
OMMIT_ATOMIC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence=
 states<br>
&gt; + *<br>
&gt; + * This test reproduces the critical scenario where multiple planes a=
re updated<br>
&gt; + * in a single atomic commit with different fence states. The key val=
idation is<br>
&gt; + * that the display does NOT update any plane until ALL fences are si=
gnaled.<br>
&gt; + *<br>
&gt; + * Test setup:<br>
&gt; + * - Primary plane: buffer with a signaled fence (already retired)<br=
>
&gt; + * - Overlay 1 plane: buffer with a signaled fence (already retired)<=
br>
&gt; + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running o=
peration)<br>
&gt; + *<br>
&gt; + * Expected behavior:<br>
&gt; + * - Atomic commit succeeds immediately (non-blocking)<br>
&gt; + * - Display waits internally for ALL fences before updating<br>
&gt; + * - No plane shows its new buffer until the unsignaled fence complet=
es<br>
&gt; + * - After signaling the last fence, all planes update atomically<br>
&gt; + *<br>
&gt; + * Bug detection:<br>
&gt; + * If the driver has a bug, it will either:<br>
&gt; + * 1. Show the primary and overlay1 buffers prematurely (before overl=
ay2's fence signals)<br>
&gt; + * 2. Cause visual glitches from fence mismanagement<br>
&gt; + * 3. Fail the atomic commit<br>
&gt; + */<br>
&gt; +static void multiplane_atomic_fence_wait(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int timelines[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int fences[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int out_fence;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_t *planes[NUM_PLANES];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool should_signal[NUM_PLANES] =3D { true, t=
rue, false };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crc_t crc_before, crc_after;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_require_sw_sync();<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; setup_initial_modeset(data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Setup arrays for loop-based processing */=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_PRIMARY_IDX] =3D data-&gt;prima=
ry;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_OVERLAY1_IDX] =3D data-&gt;over=
lay1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; planes[PLANE_OVERLAY2_IDX] =3D data-&gt;over=
lay2;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Start CRC capture to verify no premature =
display updates */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_start(data-&gt;pipe_crc);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_get_current(data-&gt;drm_fd, da=
ta-&gt;pipe_crc, &amp;crc_before);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Create timelines and fences for all plane=
s */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; i++) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Create timeline */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; timelines[i] =3D sw_sync_timeline_create();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(timelines[i] &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Create fence at sequence 1 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fences[i] =3D sw_sync_timeline_create_fence(timelines[i], 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(fences[i] &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Signal fence (first 2 planes) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (should_signal[i]) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(ti=
melines[i], 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fenc=
e_status(fences[i]), 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Do not signal this f=
ence yet, 3rd plane */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fenc=
e_status(fences[i]), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Attach IN_FENCE_FD to plane */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fence_fd(planes[i], fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Swap overlay colors to detect scanout cha=
nges via CRC */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, &amp;dat=
a-&gt;overlay2_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1, OV=
ERLAY1_POS_X, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, &amp;dat=
a-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay2, da=
ta-&gt;width - OVERLAY2_OFFSET -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay1_fb.width, OVERLAY1_POS_Y);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Request OUT_FENCE to track when display u=
pdate completes */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_request_out_fence(igt_crtc_for_pipe=
(&amp;data-&gt;display, data-&gt;pipe));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The atomic commit should succeed imm=
ediately (NONBLOCK mode),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but the display should NOT update an=
y plane until ALL fences<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (including the unsignaled overlay2 f=
ence) are signaled.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * A buggy driver might:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Show primary and overlay1 immediat=
ely<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Cause visual corruption<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Fail the commit<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_display_try_commit_atomic(&amp;d=
ata-&gt;display,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_MODE_ATOMIC_NONBLOCK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get the out fence to monitor completion *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; out_fence =3D igt_crtc_for_pipe(&amp;data-&g=
t;display, data-&gt;pipe)-&gt;out_fence_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(out_fence &gt;=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify overlay2 fence (last one) is still=
 unsignaled */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(fences[PLANE=
_OVERLAY2_IDX]), 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify out fence is also unsignaled (disp=
lay hasn't updated yet) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_status(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;OUT_FENCE already signaled while ov=
erlay2 fence is unsignaled - &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;driver did not wait for all IN_FENC=
Es!&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Wait briefly and verify display hasn=
't updated via CRC check.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * In a buggy implementation, the displ=
ay might update prematurely.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000); /* 100ms */<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check if out fence signaled prematurely *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_status(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(ret !=3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;OUT_FENCE signaled before overlay2 =
fence - &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;driver updated display without wait=
ing for all fences&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* CRC verify - check if display has not upd=
ated prematurely */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_get_current(data-&gt;drm_fd, da=
ta-&gt;pipe_crc, &amp;crc_after);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_crc_equal(&amp;crc_before, &amp;c=
rc_after);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Now signal the blocking fence (overlay2) =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(timelines[PLANE_OVERLAY=
2_IDX], 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Wait for overlay2 fence to be signaled */=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_wait(fences[PLANE_OVERLAY=
2_IDX], FENCE_TIMEOUT_MS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(fences[PLANE=
_OVERLAY2_IDX]), 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Now wait for the display update to comple=
te (out fence signals) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_wait(out_fence, FENCE_TIM=
EOUT_MS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(out_fence), =
1);<br>
&gt;&gt; One more CRC check required here?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
You are right, I'll add that.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_stop(data-&gt;pipe_crc);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Cleanup */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; i++) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(timelines[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fence_fd(planes[i], -1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(&amp;data-&gt;display, dat=
a-&gt;pipe)-&gt;out_fence_fd =3D -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void reset_display_state(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary, NULL);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, NULL);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, NULL);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_set_crtc(data-&gt;output, NULL);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_commit2(&amp;data-&gt;display, C=
OMMIT_ATOMIC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int igt_main()<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; data_t data =3D {};<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_set_vt_graphics_mode();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require(&amp;data.display, data.drm_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_require_output(&amp;data.display);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; setup_output(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; create_fbs(&amp;data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data.pipe_crc =3D igt_pipe_crc_new(data.drm_fd, data.pipe,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IGT_PIPE_CRC_SOURCE_AUT=
O);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test atomic commit with 3=
 planes (1 primary, 2 overlay) &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;where 2 planes have signaled fences=
 and 1 plane has an &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;unsignaled fence. Validates that di=
splay does not update &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;any plane until all fences are sign=
aled, catching bugs &quot;<br>
<br>
&gt;&gt; IMHO, the part of describe after this redundant. May be we can sto=
p it<br>
at 'signaled'?<br>
<br>
&gt;&gt; Thanks and Regards,<br>
&gt;&gt; Karthik.B.S</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Okay got it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sebin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;where drivers might prematurely dis=
play buffers or &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mismanage fence synchronization acr=
oss multiple planes.&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;multiplane-atomic-fence-wa=
it&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; multiplane_atomic_fence_wait(&amp;data);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; reset_display_state(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_pipe_crc_free(data.pipe_crc);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cleanup_crtc(&amp;data);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_display_fini(&amp;data.display);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; drm_close_driver(data.drm_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; diff --git a/tests/meson.build b/tests/meson.build<br>
&gt; index 0ad728b87..cc356610d 100644<br>
&gt; --- a/tests/meson.build<br>
&gt; +++ b/tests/meson.build<br>
&gt; @@ -36,6 +36,7 @@ test_progs =3D [<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_dither',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_display_modes',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_dp_aux_dev',<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; 'kms_explicit_fence',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_feature_discovery',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_flip',<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'kms_flip_event_leak',<br>
</div>
</body>
</html>

--_000_CH0PR11MB5427281EA2CF49992FCEEBEB9865ACH0PR11MB5427namp_--
