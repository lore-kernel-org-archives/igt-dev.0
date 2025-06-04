Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FE0C5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 20:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C1410E837;
	Wed,  4 Jun 2025 20:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqhNKgpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9835A10E837
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 20:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749067587; x=1780603587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S1FlS2XF63hAMNHMakmXnCkqOTOrCOCaa5+SimaTmIA=;
 b=iqhNKgpNcprxSLPJalyYNu55/vsmm+E2ZUBv2L8Aki22CboBTz2ZVKus
 tjibL0LLb8MhWva+7zTzOm/vKyywFOf9Nhc00mAkbRWAc2n3aBFIimRkf
 s4/f+53BzWLac/uThzDJDY6vvx6WYhyByx3vbvlWZlzgnoSOu/+5rSLW+
 Q8DmJRihX0oa35mhdoF+KmDtXVYW2qfIl670RBJ0Is1L8xInpRavaAxPX
 P05hw08MoLVwSEFVvMk9qRmrobql9nucDfIy3EwtC2nyskmvcdh/xEMCd
 xO6FnUhY/NTMy/wRXixFUkO7xTpuQ5znpK6nV4IjDpX//sGWTw/48re5W g==;
X-CSE-ConnectionGUID: rbaK5yMeQcSJ1YcfxRCDCg==
X-CSE-MsgGUID: X6lpFK9eTu60rWbRWk0VDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="38801449"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="38801449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:06:27 -0700
X-CSE-ConnectionGUID: qG9odUMIT6GHlkSS3YRV5w==
X-CSE-MsgGUID: uCG36rsbTUC5Wv5qXfc7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="182492973"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 13:06:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 13:06:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 13:06:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.84) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 13:06:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rj37nLlY3JtE0dlLBVUsz0RAEOGdHFLPqTyxxC6CD+Fa0qOSBSBaA1T3FBUnzKjJ2H5LcPFbjXCkm9V614yp626eM1lcAiLdz+Y2NJCYSChKZd8BLgYFfFfgsOCCeEopupvA0N/t1y2LgC2FexxSFR2z7mIVaJtvdoHKsI82NpFRC151OGuu7jne346Xx4AXkj9rTOm0HC03ggcYwR9GIbHPVoz5yqaPq3rtoPV3a9KpFOk6s25pFQ703RbA/r9+txPMGAUk5u1mqB9awcnnsdVQikdfhXH6K+3mFJwQ5y470YTjKABkdwOADwjd6HP75k89LjwNtwTeO6xRQ8LDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXFazCkG3TIZR2FZfdC9BK1s5a/hKoJenSPTqnVrszk=;
 b=L2zeWcKsMX1PELmeDCW+48df/zWCAz0U8JbvhYBsafcorOj0pkqu4yNKCrSe+wSVQN1KA9iTzAog5abm/6IT0wYDmIkHpfDVJYjvLaea1sp+a07dAGkvuPfLUuohQvYTKSW+0YKddqP6ZVpHBv01yg2dZMnhvz8CLal45uezPLVkwEPE4KSa+LCAeaq/uj6PT/KKfmfbsmV9lFUN5/a915ORwnVvJxfY/FQQN+vS31tB6+5aKuR8WqEBHYak6JKcP1xDUPcwZPJnDZs9NMSc3eGosWgnwbz3MQF4h4u+rnACteHcef3X0TUyxF9YYb71P1gZh9Jeur2rRV4oiuK0Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 20:06:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 20:06:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, 
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb1XMTXdMvLbhwo0ypNpX8yrO93rPzbN8A
Date: Wed, 4 Jun 2025 20:06:21 +0000
Message-ID: <CH0PR11MB54448B182962FA1CEFED2465E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250604170621.83132-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250604170621.83132-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6406:EE_
x-ms-office365-filtering-correlation-id: 2a41298e-954a-4b40-1091-08dda3a34699
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rOBcsPLS24cFMxkITH4e+cU3PPUvXeZPmiN2iVowTK68OeKfqPV3GpC2B9QP?=
 =?us-ascii?Q?BSkF7/QOOlIeRsfvZprpqiJfd6NP1ByGEoe/NhNsIImn9DKwj3HUiknU2BVn?=
 =?us-ascii?Q?Oa1LBvUekEyfrlXAgK3M+tFRU9JsEzkHlJL/6Kh+W4yzo9ZTtfan6W0v15oj?=
 =?us-ascii?Q?jlMxxifPBdsL9U48Y37hesIExTA/8765CDIjZCA21EH5g1dcouFM/63X1sv0?=
 =?us-ascii?Q?CNrASlorZKSMlJCWtlI/R/1grEKapAz7DGzJJegFkWwYW7yIMLZ2zvFzjHM1?=
 =?us-ascii?Q?8uEDr1Xt2jb5J2i1Kr02zCXS7fQsqGtn0hZd8aTzJ7C1UW2xUbo0VbO+3mTK?=
 =?us-ascii?Q?3nW35kwJXNbHDe8NnkkvXJ+rESjZP4KOi92EwfjzJC+LdVAfryCMZNRH5vnV?=
 =?us-ascii?Q?DCaUmiCjQKzF9OPJnCdoAZMJCwOmcayjkIMlS8sCWUFdGV8WyZ0AxhuJWb6j?=
 =?us-ascii?Q?Xt51fEYbRa8U0TZXViA1hDR9kVlJL9uW8cBO4x/e2927f3v51YbGUzOCh9cS?=
 =?us-ascii?Q?btdjDOtvwq1XO3WpfgHFu8xHxQTY8JaZS+MtGehxsqtZaU6Z2NalxQX/K73S?=
 =?us-ascii?Q?UAewrFefb7ilEhh/WfDICpfEPLG2CWCxKq11htIlrTyb+LvhGQFp0ZeXqhcD?=
 =?us-ascii?Q?eBvtV3QVgP3wYOYOw6IiPxTyOFHzNtGokXNWyhqZ1i7m/M8wT0wKBn+d3Vyz?=
 =?us-ascii?Q?sDxp/6XCBxj8dbZkMW1WbrG0WHgWfeb6BHjQXMMbpspnu0MD4p6KGqbJWAsG?=
 =?us-ascii?Q?Uy/xds67KAochsNrHHWOCXYVTpwLMKjsoS3U8Av4kJZeaVEzESWBJig28m0p?=
 =?us-ascii?Q?URHOl7dExPc0XqNDeN0xk4foFIRQan+7WkpPVq2Yk4+Ys5sqgD7dyuyL7T+q?=
 =?us-ascii?Q?nsHrjqH+jQQG2sUIIjRxmb2LT8Czips1CTSRH2pB759aUDWWYr+VE0757RCn?=
 =?us-ascii?Q?9TbMi3/UmXGXaM4+nXdK2ycsVmasqQ4tr58sbRHr/00zuI16IyWjAmTEZ/gr?=
 =?us-ascii?Q?lo4YVy5I6VIyIBzFzc70DTwu03ErPrX12PNGztDX7V2U8X2l5E3rc+ozpaj0?=
 =?us-ascii?Q?JhCpTrnzshRefl6+ncUZ2oWBds6laSCoMTOXIOQGuest9sSoBv45wDTnPO5w?=
 =?us-ascii?Q?cSVOjdO37uECaaeJI0JyfC3GgJD3d0pDqpgyA94tJUIUmpclbQ6No3+UTY/u?=
 =?us-ascii?Q?UAq2islb+W32tMgQTazAVlvVxuWbBEdNbh/46oaeEdUR/T3vCxGdCGGtHZmD?=
 =?us-ascii?Q?Oti9mkZMfMDT2eiaZNhJ8EfXiyANcD5PYUxh6cg+MG9/kp51VAN00oRE4oKc?=
 =?us-ascii?Q?2Ns+/pOTdMV7syA2gZd9Dx9RSbjmY7eAZY9bez3zMGgyG0hYjvMcUDA1DOVt?=
 =?us-ascii?Q?w2GGELbsOH2W2wrYjYsGHNvyHo9UU9ahcZPrPD9FCXAgvUM57GYYImeJZoR3?=
 =?us-ascii?Q?O2drnnhXdIMZpYbknxzHVfWSDrZxPR/W2pw82cBOT+rgVCK1Fa61pw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kn5byBOovovkPfXYw0S0KSTizAjnz4EHCMTp8rRQbQORV/SmKd7ZVvmx82tS?=
 =?us-ascii?Q?xLaZZvzBMCejtz31/f7y5Gl/8DEPY7X9i1YNv4hTae3YvAwz2UdtGqaW8Hxt?=
 =?us-ascii?Q?uwFXqpSocCAL/Wvc/1Ya06yfpSHc7KLH9z40Zfv4reXAFQdq19lIjAS/iOez?=
 =?us-ascii?Q?ysAB2tTQLi4wARsdsxB/OHAo9i0UcTNO1s1InBErAqiSkwSuEwWREOcZz7y3?=
 =?us-ascii?Q?vxehi0GvtvuPQG0A2PVtbTcP3L4FNlX83x86S3VqgcyC+G7X/ILoR7CWBuOO?=
 =?us-ascii?Q?7360O2kNjY4PuvG2jKWzb6sgLTM9scbb+Ijk0vIsQn9Ifhngbj+xbg4KjAAh?=
 =?us-ascii?Q?4PpjpLH63K0rRsSQpCT1EF1iWmNdwm1wbnQjrVU5BYK77at9lEjLv7fO8JKd?=
 =?us-ascii?Q?J/fnNcfCm7StuNQ6tQwT+P4rNhGtATUXxhuTM7uiboGyYswkFTsQJMzvgNOn?=
 =?us-ascii?Q?XTY4+n95aMdM0FwWvEGgfvsCi+wqlpwx85eXnElC3BEbvcEldgZFE1/w/ifE?=
 =?us-ascii?Q?HxQadoXYKWmeiGMJ3g/35OVCUTZZ2fZFk3LjQJB8mxuUADxCqxKItjWZM1KM?=
 =?us-ascii?Q?aUHCP36BtJ1SDhj1jEDRCGIelRyhE8gLv7M7NDw2lNsYc8CJO8j3kng3L34h?=
 =?us-ascii?Q?/99iPdV0wbHepNACFWFtOWAa/QyE/iVW25WbxZscXJ72vOtzwJL3bjt9Q1q5?=
 =?us-ascii?Q?KxNnTAAh5ioLf5Ao4EO+ca0MEbosb+8wAbeIsAOF1ltxnDHaZI2//0pR3Dyx?=
 =?us-ascii?Q?1Gb3N5/fvkFiOzCErTB+be07z+AbFCdAQ+wlEGzPgTJDVMmSkoXpHr9XsVCq?=
 =?us-ascii?Q?PoZQqjnzCNgDUYdx+Ow/uehMRkIIYtSXpVVUHUWSgtHgJH1AHIwYIdxe/d1n?=
 =?us-ascii?Q?l6/0DVunGNPlxyzTQUyz1Ttp4RMPeeCx+GJsk5E5xXaKfuDih79QFk0+RKUb?=
 =?us-ascii?Q?wEsjkYj40TbRwqt5e6/D64dGcpwGAOKq372FvjVNV1D4Ho03aWdtY/3DMHnB?=
 =?us-ascii?Q?5tqs1+YxLAFLpVdb4Zulo9D/bfc1sPKsLrCqvGqVPfsvNR9dTAWA1Anx7ZWk?=
 =?us-ascii?Q?VkjM4HFZVpFfsrZIh/MUp0X+NRbFddb9F/mJQeh0DmqcPg61+nh4dloNPBtD?=
 =?us-ascii?Q?4JkfXkvQ/+d9Wk7cltQAsuNq5v8LgtJzjK1UNwWeQZ5fh5FFzYhtcH3WwtFC?=
 =?us-ascii?Q?KDJcXTMgV52h/qDUpV/ENmMS0r8tmUHbRBiu4+uFnEmj4NVqioH26qfs4VhS?=
 =?us-ascii?Q?FHx3zqK6Eq6EN3t1rwL5RwwI/b3FYFHEfLK6dpRNsP2QI5WSC/WxoiWo8T6S?=
 =?us-ascii?Q?4qYgGGbZHz1FtRCc6TA3/ygYoPOwJstczg75dge/Ww+siyKz7BF6cdr1zih+?=
 =?us-ascii?Q?nqEVeu71nnQ4NAQGjygcZR8tXPpjzD++1izBG92d66OQc3n/cX7udMf4PC2n?=
 =?us-ascii?Q?eIsNf+uO/wIC14kGekjRYkKrIeau9O4k/03bKG5ygenjTBhUWyA7s0BWlpWe?=
 =?us-ascii?Q?z2KUkce6apoZvfprcmM37+xi3bOzDgEWaQRWNoKNIbaFCuq38bdYEeFxo7Ia?=
 =?us-ascii?Q?aQUjFiwg2qvj4WTWamLnEiTAoopPWGf8tKSjmTUB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a41298e-954a-4b40-1091-08dda3a34699
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 20:06:21.5690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZr2c5rzTa+WctZi73GyobLN7J/j0z4QdUAWqHm5ED3ZJSuwnNz90Kb18iwpOp+6uVx1iV8cEJQZbUWivrB/JPY0KYkqtKFmTeTQEzE53Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
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
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Wednesday, June 4, 2025 10:06 AM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; K V P, Satyanarayana <sa=
tyanarayana.k.v.p@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com=
>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Lu=
cas <lucas.demarchi@intel.com>; Dugast, Francois <francois.dugast@intel.com=
>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Harrison, John C <john.c.harriso=
n@intel.com>; kamil.konieczny@linux.intel.com
Subject: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors while=
 injecting fault
>=20
> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>=20
> Currently, numerous fault messages have been included in the dmesg
> ignore list, and this list continues to expand.  Each time a new fault
> injection point is introduced or a new feature is activated, additional
> fault messages appear, making it cumbersome to manage the dmesg ignore
> list.
>=20
> However, we can safely assert that all dmesg reports that contain
> *ERROR* in their message can be ignored, so add them to the dmesg ignore
> list.  This unfortunately does not include the device probe error
> itself, so that must be added separately.

You know, I just thought of something...
Aren't we specifically injecting ENOMEM as a part of these tests?
If we get anything other than ENOMEM as the errno return value, then
that should be unexpected.  So, are we certain that we can safely ignore
all error-level dmesg reports here?
-Jonathan Cavitt

>=20
> While we're here, we should also assert that any errors we see are only
> coming from the target PCI device.
>=20
> v2:
> - Only ignore error-level dmesg reports (or, at least, reports with
>   *ERROR* in them), and device probe failues
> - Add PCI data to regex (Michal)
>=20
> v3: (Michal)
> - Revert name change
> - Add change log
> - Remove fixes tag from commit
> - Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
>   move to lib/igt_core.c
> - Minor code fixes
>=20
> v4:
> - Return ignore_faults_in_dmesg to tests/intel/xe_fault_injection.c, but
>   keep it renamed to ignore_dmesg_errors_from_dut (Kamil)
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 39 ++++++++++++--------------------
>  1 file changed, 15 insertions(+), 24 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 9fe6bfe351..14aaeebf5e 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,28 +64,19 @@ static int fail_function_open(void)
>  	return debugfs_fail_function_dir_fd;
>  }
> =20
> -static bool function_is_part_of_guc(const char function_name[])
> +static void ignore_dmesg_errors_from_dut(int fd)
>  {
> -	return strstr(function_name, "_guc_") !=3D NULL ||
> -	       strstr(function_name, "_uc_") !=3D NULL ||
> -	       strstr(function_name, "_wopcm_") !=3D NULL;
> -}
> -
> -static void ignore_faults_in_dmesg(const char function_name[])
> -{
> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runn=
er */
> -	char regex[1024] =3D "probe with driver xe failed with error -12";
> -
>  	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> +	 * Driver probe is expected to fail in all cases, so ignore in igt_runn=
er.
> +	 * Additionally, all error-level reports are expected, so ignore those =
as well.
>  	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOME=
M");
> -	}
> +	static const char *store =3D "probe with driver xe failed with error|\\=
*ERROR\\*";
> +	char pci_slot[NAME_MAX];
> +	char regex[1024];
> +
> +	/* Only block dmesg reports that target the pci slot of the given fd */
> +	igt_device_get_pci_slot_name(fd, pci_slot);
> +	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
> =20
>  	igt_emit_ignore_dmesg_regex(regex);
>  }
> @@ -234,7 +225,7 @@ inject_fault_probe(int fd, char pci_slot[], const cha=
r function_name[])
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> =20
> @@ -299,7 +290,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_c=
lass_instance *instance,
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_q=
ueue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queu=
e_id) !=3D 0);
> @@ -334,7 +325,7 @@ vm_create_fail(int fd, const char function_name[], un=
signed int flags)
>  {
>  	igt_assert_eq(simple_vm_create(fd, flags), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_create(fd, flags) !=3D 0);
> @@ -397,7 +388,7 @@ vm_bind_fail(int fd, const char function_name[])
> =20
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_bind(fd, vm) !=3D 0);
> @@ -445,7 +436,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, cons=
t char function_name[])
>  	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) =3D=3D =
1);
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONF=
IG, &config_id), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG,=
 &config), 0);
> --=20
> 2.43.0
>=20
>=20
