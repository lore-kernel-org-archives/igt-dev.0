Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E6FC5DF70
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 09:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C9710E3E6;
	Mon, 17 Aug 2026 09:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jk9XruYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE8C10E3E6
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786958127; x=1818494127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9KNgrsFNKsHTrd52aSqf1GHc1EzPx9g6v8hx1h6NyIQ=;
 b=jk9XruYjsCOdEut5xJvyY1N4lQ8/EXmAoL0F2ONDKWvpa8Bzb0JckrtS
 6gkc3DuhjY68mvKRWmBqNXaNsJ/FudnfTminfAnUMS0F+LLwss2zvy6QN
 nTR5jFNfJSc0MSfL0ktqY7FUdUiFbddujI61ViP1fffVRUvMVYdJ/xKmw
 3kpMW/rVCeUkVSezeGTzD+QeeGnqggnoQnuDE3kgsx6cvg7MvMzWZO2WG
 bpnwfDCvLDjCOoyIot9lsg/a0V8t2cbTUIzxfKhe7cppU6jjOqODQjtSU
 Lrt0SvPVtnKSuV0UmYfVGxpXtNX46YnZGun8/FgK4JhzL64k4xl2Hud1Y w==;
X-CSE-ConnectionGUID: CfaYr32EQJmNSnV62YT3Tw==
X-CSE-MsgGUID: Vs1RqEgtQjODLCel/qcSKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87284241"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87284241"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:15:27 -0700
X-CSE-ConnectionGUID: BhLQE5gbTYiRc2afg7CnVQ==
X-CSE-MsgGUID: t6C2QgLdTImc5afIKQUPHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="261117713"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 02:15:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:15:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 17 Aug 2026 02:15:26 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 17 Aug 2026 02:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHmVBcaVKgcNmkqRJebgy5bxCbftq19MIbACbJJL+k1QsA/NhVZRoQ3E/HLnm4uQT3oADoI1UoeZNHnmG9pccn8KEBCtesYPEKOEdPhMGIWTYX8H5CCyKpJrOzVnfTKRjmBIUIQ5UOsF4cWsyj6l1Cyf96lfDh6AE3YRiU7V/z3kDD76u25W5PEVdAAsw5Bw7N7eWFt8WqmiJ3+hOONrImkrcPJNpZ7LFHWvarTsqNkaQ2SalKRo//b1gpABXisUA+r3UbyfAde2kwZrQmrY8tBXcFq/mre4htVHISs9aprYWV7EQ1BGtCisdJdOHe/kMwudb4i3PdXpTPn58/GgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWboyx+yI8k1/tyBJGJZof0VSvz2L2Mbc1PFDOZ+7e8=;
 b=CFP1cNz5twtj3jkfSu6vLoOFVJbjHxfXxYlCK6PIhKtF5XHXWfPPGTmf86HMXkqFCkQLSKjFCA7EFByPaXXkNHbN9zNBoW5Qjp9MEtBGB3jJUbsjNlY5hAVapPXcAOyZ9pg861OjfjyPOw5K6+/v276BpkxQWZWy/lY3Yk2bnLcYpNKsjLRT+0ASZYOKxphvjdwWTAd22dwXv1vZmJ+/Gx0U1QFQiaNONS8VDoSAIy4kBuSBMbUZY6L3OI7386w7SrGh48NT3IX8CKhgpJrB+Eg5m4IeOqV8Th0blKzWQG28VLIkamqYeJe9zrncuuVlBNcp7auw9fs8GV2/L4bePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by PH7PR11MB6908.namprd11.prod.outlook.com (2603:10b6:510:204::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:15:23 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::c87c:19e3:6b0b:1931%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 09:15:22 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: RE: [PATCH i-g-t] checkpatch: Ignore camelcase and igt_main()
Thread-Topic: [PATCH i-g-t] checkpatch: Ignore camelcase and igt_main()
Thread-Index: AQHdK0+RRAGG8k0GtEqRmMx+QBFBIbah+w8Q
Date: Mon, 17 Aug 2026 09:15:22 +0000
Message-ID: <IA4PR11MB92514EE9E8C7DB045EAF63B399A72@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20260813181255.162149-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260813181255.162149-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|PH7PR11MB6908:EE_
x-ms-office365-filtering-correlation-id: 2e1a6d4f-1a85-44d1-ce54-08defc401117
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|38070700021|18002099003|22082099003|3023799007|56012099006|10067099003|11063799006;
x-microsoft-antispam-message-info: IxenjEq5qaD8y+H607jnXgyx2Uwbqq2veA8hxDwMkaylXBU5l1NhrLfWqcxkXkvf1UY1W3jifSnC3NDWFtBYgTwXP+K9hd87gs4oFjT9dblp1vlRSMrByosZm4IYGbOMT5XqZ5zV0f2nn4cwGuUrjP4HztbrGKAN1oW0KxJcsVrqsRFGUTXV0KkutCz01eB+m8eXUyH2kTgdViHKKMZzw/2a4tchV8J5YeLh0pAZ4Q0ws2HzweOUm7fH2vRW7KFhXE+vuG+CFVnjKtX9RCWZA05JExI79qYlwRuBPLQWPNOroNoJx6mCf7KUSdjuy+oPmeVChtVUpZlY+plsKt/F/l0MKYNyxImcg8wgiCjcqJf0j/zYaSboU4SbpThAjNPmUIHvUcDAGCif+uynehIES80flo+NdrJhvBoU93bPyeh5SgNVAfrJCO1M70CnQWvhTwuAAEzuxybOm9Cm81xb87UbNux+3rdLfMARQHK5IE3AwhiHZWZHqCALRayXb5rBHdsonEMmi2cR/dGyV+yOEcfXGdRu/eyCLftbsFw0iXP7Nc35LbiZffysa4Uk+KnAuVssKqtZTU7cnTvm/3qbT4quPD9Q46nGHfbSft/KZjGzUVGOjh3Zi8vVWMBmmjIshvVisnpavOO1250m/+z4rjPb7K9FxGsTz55FxCZ6FiLiduNvFC5iD3Kf9EMqq8gRW05QDSht/EoErwGzZIhnWPj+rCfOBNco7/M9rPQwaLQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sijKNZsEfxtENW2bcV3AaWUr2JRa7dAbegiKUxxbwpevky/ZZXl3Z8QKNFNR?=
 =?us-ascii?Q?b8NoeEd039VMVOPubgUF3tHxYu2GVmuM+J9tydRo9ApoMkf3SoxSqGDcHzcg?=
 =?us-ascii?Q?WNpKwIecq/37VU8OKX36mNJwen3jl1QmJgS8L9kdHA0//BzKaQlijsvJSrD3?=
 =?us-ascii?Q?0SMhaOjiDk0J0rJtgtX9KGa7j0mE7sWpQHyGouE+1ZhFy6dcnhV2k/uC/HqW?=
 =?us-ascii?Q?8APT/7qlQVDn78HB1PjYALqYKrtBFR3rP4wO2Aq/NJdL7lkaIese3Civ4e9t?=
 =?us-ascii?Q?eHY9hvGigVzExvhiAEgS5PFVYT5M4X4U0iq4AlHfaa8ib7e59+TkIS128Oht?=
 =?us-ascii?Q?ZbVlVfuFvrgZYvzChocZAZMVKyWSnOyDf2VbJq4P3WG140ClsKTJ15j8zu+F?=
 =?us-ascii?Q?viCxcAyaLFZvOKixTNoBJQJaoLmHbmINyMZ9rUCWkbsS/V3QLKPqtrYrFYlK?=
 =?us-ascii?Q?/7yLIo+Wc103EkxUZBaOy+OmE2Hq9Xf1B93ae5hAkQDQRGOo0KaEnMzk7wAs?=
 =?us-ascii?Q?4HLkiQ/fY4kEV7qKdyHPf3IN3TwD3OLPSAIF3J3rwVQcUOz/Gz1oa6Cx6sRa?=
 =?us-ascii?Q?GP72XE2VO5OxK7nLFta4ZNZ7yqb4VIUMmXgkNktVd9/DXSoo9GQQbVcc6n08?=
 =?us-ascii?Q?lfevPdwbGqNRb7+sd7kU4z+s+hMSrnYGul4QIOgriT2WM6+FskIRj9Vf+lUK?=
 =?us-ascii?Q?IEoLQ/cBG1N4xmPMSXOk1B+vnD7ugCsYXYcwHnarnhJg3PyaHarCwjR9ZYIj?=
 =?us-ascii?Q?dQjJfyBPcDe0nrsxEhF5UQWtG2BW+WWFJroR1RHkiYvFBy9sr4jNWMDfluYb?=
 =?us-ascii?Q?8kEzJYvRLbLrBnzby8S+l5HEM9aJiAhgJNy1c3Uzp1OKZRT/pfFE52JzhJTI?=
 =?us-ascii?Q?ewf2TmcYyPUHqz9u9EEn7iHTzrouvmWePVh5n4z88cWlHnzR7naFR65JUQlZ?=
 =?us-ascii?Q?kfT8Fg5IWpl+4R73I5fYYfVUgB0iNLrovPUWYR+AKnMEePQDicXeEXLcVk7n?=
 =?us-ascii?Q?GYZ/DzoBP6rqnhppZGLsaO93Qg+U8dsy3X+p1Nn7Vy+u4EGzUAQxqlLN5Z5Z?=
 =?us-ascii?Q?tbGgVikIUSmctxpRZMiQloaM8ruwKxYOGFdlGScxzqDLxO5ZBjwOYhrJqkH4?=
 =?us-ascii?Q?LQ15P8tnab0/4QsvVw9zds88JkbrDY00Ascvw7tCN1FCHGAfaoBd3IujpbBh?=
 =?us-ascii?Q?mQxbCjW3jOT1HA1NVCSkGwcG+MAAKnx3RPGGoJBL5I1c2oQLaD5PedEzg2OW?=
 =?us-ascii?Q?7ooZ7bSsyyqY3FNZIaVaTLv5v20Ic2spfdEWkyBq58QWs/wQ1BV/Miu4VHDO?=
 =?us-ascii?Q?qVbmNFM5lQWoRZZwaoTBuBv0yCKiUTBzkhS174TuRcsztVpjjcuwn8iE3Cw6?=
 =?us-ascii?Q?/N6PIQ6Ntpi/dFhpMK4NOlcGwbRg5vHDaIlN+GmzPUkTt7lej1C+bOW9XJw7?=
 =?us-ascii?Q?dpl2b1+Eax8+sVqSspHKiOBqBVafiDyY6I/pDS5dHKIZiq/mFv4Ms3kC/RHu?=
 =?us-ascii?Q?dQqi+e0fNfUrwqjlN74Mn7cVrsYiXuZ14fNVwFOcK612WUgr30p+A1JnuZzV?=
 =?us-ascii?Q?ooa8S1bBxNQVBKu84m68MdXFeVBSeAlONPhOyAl/BdMpUVWm0iOCRZeMhOHn?=
 =?us-ascii?Q?kdea3ZSS7bNgwUcEObcnql0S1T3uxvNabZuGrbSM7AS/AQZ/0XjSh7bdxceZ?=
 =?us-ascii?Q?ZVshZzpX1h3UkIRX1/APyiWgvyTbcLXCcH1rDuM4NkCBXpc809H55MaSrsS6?=
 =?us-ascii?Q?C/p+BTHbnw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PtweTKtOTwyGDuxazPCzAm14/4wBvaFXZfZSWQAVjDA6G0qKc1P7c0GkVj1Cj0MGc1nmHDH7KrTtPxuJeb7ajhcZV2tVP6XM8p3hhUvv8ZPFYHBxVXaiJmuetxIpig95eHoPT7anqm/JSd0BkGo+1+4tSIJpc3lhb1cBadn0QAe+1rQ4nHDrtmrm2tszONaN2QpVyXDmV+AVRZDmvdzQpKcE3EJ+r0xBOcr3xrglAUGgO6hbWYov3XWYm3bx6X0rc4tUzan5Kby150hmMyGsS4zoarsLdJZW1ujA08wW9UAbj9ex2I4K4XD+VXLvWdXWo+xxS+2EmfL/QpBI7annDA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1a6d4f-1a85-44d1-ce54-08defc401117
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 09:15:22.7830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GY9BSyoyN6DYvrt2a63isIPzvGggyKO2vAL+GUZTDtM8lXcCQ6qPp2v2gqKbr9MRRjJ31rD8vMGV5vXVTTKKhtCuag3Vx/xg+2FFLR50aj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6908
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

LGTM

Reviewed-by: Jan SokolowskI <jan.sokolowski@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Thursday, August 13, 2026 8:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Peter Senna
> Tschudin <peter.senna@linux.intel.com>
> Subject: [PATCH i-g-t] checkpatch: Ignore camelcase and igt_main()
>=20
> Camelcase is used by both drm and glib and igt_main() is a macro
> without parameters. Both are valid usecases in igt so instruct
> checkpatch to ignore them in patches.
>=20
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  .checkpatch.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.checkpatch.conf b/.checkpatch.conf
> index dba22494b..30935c50c 100644
> --- a/.checkpatch.conf
> +++ b/.checkpatch.conf
> @@ -2,4 +2,4 @@
>  --strict
>  --show-types
>  --max-line-length=3D100
> ---
> ignore=3DBIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER,PREF
> ER_KERNEL_TYPES
> +--
> ignore=3DBIT_MACRO,BOOL_MEMBER,CAMELCASE,FUNCTION_WITHOUT_ARG
> S,LONG_LINE_STRING,PREFER_KERNEL_TYPES,SPLIT_STRING
> --
> 2.55.0

