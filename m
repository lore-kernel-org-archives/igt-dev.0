Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B6BD4336A
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4550710E5A4;
	Fri, 12 Dec 2025 09:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbsWGpD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27C710E5A4
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765530869; x=1797066869;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pizRw5kOlRLloQx9Z6HKJlGboAVCCiCftQzXmyJGQag=;
 b=JbsWGpD0svcelFL6G+gmupWQq+GSGV9KT+wKRR1fzdy8tP7tAKCZzEIY
 9x4g4vo1FISuOlgw6YNYbD9qTgSZ7xzq9KTDE6zikqeEF/wRbGClPXSzi
 jRAJad2lgUtVliNfMRo4JO3sBm89t31isW/OL6PyHX+HZ/6vBtsRklT+1
 7+hIr9hOHQ9g2SvyXPIuK32DOqkOAYOp6s8yOq2Y0pWZY57fmUAYZmeyS
 3pf2M4w1a2aPI1a3Ldm1s9zSfOh76dmboPvVlndsOtHBOP4UvfkcTa3Ep
 S7rB2SStQ/ORdSgZv03CBS6GwVLbcptdTKlzQdfC/c3xZt83+YYd16rWa g==;
X-CSE-ConnectionGUID: 4TK40gQQT+a8zzihnSEyFQ==
X-CSE-MsgGUID: OmOjtqYORI61o+vHEoJXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90171969"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="90171969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:14:29 -0800
X-CSE-ConnectionGUID: 3wL070mUSwOTUVu6Nal4Mg==
X-CSE-MsgGUID: 3eayxfRxQQW2rRPH8me43Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="220414305"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:14:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:14:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:14:27 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:14:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5cnmZ3MI9zg5s6Pg/ldT41/1j2dlN9qd9kyeLoqrPXHYF8nXnAt2OmQzI5mQM3yEOxLoZ057rcBPGfcJDgvv23msdg4/lH2i0HumwqRJmXSywEHC/dUn+IK5OcH7Isg0SzB8Er2rLZc/PWJCItu+cv6px16r7p014C+Rqid9zP6ZUo83sfwGo33ZFMGdSjvAAotQtp4DUJIILU1KTx2YEf/NDTAn+SxRDZmPJpyBZ7t4o1xtuU2xlyCbk+7wq3cSKFdkmPlADKg+WqbGhDTzq9u70L2l68LPbH/Blmc/3+qFHT8DAJDRXX6B45QDqv0VK7MzuJszgXZ/L5iOUgsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L8hq++saPui1H79d0+0tCildwKMcAwfUal6G86WMcU=;
 b=v1yn7cYwO2cO+dr6E9H0gGTsvxRTLqyfD39iZ0pMu24gbW2nhoHBBEvbiDSZeW+nXVqoHXTHTUpF6XDzVc+64ZzPTAQM4fXg0dwKel8u6ZYjZCN0LzDW/fmQ99UE8Dt/5YT2OI7hkMYAxPa2JfvY9Bhk16XArfS/IFBDJYnWo/sKB5sUHmInXGN3JIKjt63iY1lyHOk52Xq25nln9plLC1xGwsZYjJGsgacbGI0kL02jPPnlt6V7hxSz8Vsw15VLEPoolP/qt5J3GgeU7+OyRW8KJ+0xSGHDJZ1zzJhTZkDZA3fqLOI2FOpSbSJYLP50ISXyNCzo7TCi07p9EgxC8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA3PR11MB7488.namprd11.prod.outlook.com (2603:10b6:806:313::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:14:21 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 09:14:20 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test
 patterns to framebuffers
Thread-Topic: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test
 patterns to framebuffers
Thread-Index: AQHcaYRkBM3oL/3wnEKKtEV2QbP80bUaOHcAgAODtXA=
Date: Fri, 12 Dec 2025 09:14:20 +0000
Message-ID: <DM4PR11MB6312A8D055114CD8EE0FAED790AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
 <20251210032349.2781106-2-karthik.b.s@intel.com>
 <DM4PR11MB63125FA2DDF7E617D94ED2E490A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63125FA2DDF7E617D94ED2E490A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA3PR11MB7488:EE_
x-ms-office365-filtering-correlation-id: fd489fe0-6428-4a91-6539-08de395ed5ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AONIMnoUZV0+8KLwr+94Ub6B++BH/HbhQYscSntWAdNKn2pLhRzSaCs1+bJF?=
 =?us-ascii?Q?PlB4Mgtn8EW/u/uhPXng2SUzIz648dPcIN2sHYG9Rj7s0Mnr3G+R+h2OeK5o?=
 =?us-ascii?Q?MX3gpkCFkgQgx7215muXPApEzQyWIsOaIfFXtpT7IgsPo4fdck4dBb2fT7R4?=
 =?us-ascii?Q?tIB8J/ckWC5hXgzh7Yngx5sURBofMqY3y8gB/o6fr9MODj4Tbasrb5QKM0fw?=
 =?us-ascii?Q?ObJgDlXCyryQDyTRQHTEr6g//090m7gmtICtMKtATm05TwETifPiVWut3hse?=
 =?us-ascii?Q?WKSQnTDzIB8FcHJoLPOhjko9zpTES+o+y0+d80Hw1+Tp1amsIGCyVA9YL/dy?=
 =?us-ascii?Q?4dmpnrzjp05TkpZ1hqaWDf/NZL6eFLGBQ1ykwsReXqPkFsHkqKLwmGFLrlkm?=
 =?us-ascii?Q?hHLU/jyXmDSRmKvOdNz1TW5CRyA/bPLTlEVtT6ewVpeAqq8tDO4RsmdpyqJ/?=
 =?us-ascii?Q?CKOrDzFZjg3ehV0gfZyGSWVQpbHZELn1Ju/z9U/SCt1+p1coMBROqD6pjDK5?=
 =?us-ascii?Q?zaMpeDouFpXZDgFxITkQ6HW1Mb5IbJHY6uGWyFPjveHk/4agTkqDIC/V6sz9?=
 =?us-ascii?Q?JSrDIQ+JlGg9uY8RWFbPr/6VAyxb5Y7Rfs0gWj3gEOQxPZKgDilZO4hskIE3?=
 =?us-ascii?Q?7dG5X2+ai4/rfDqL7cVpXA0Hz56j18/7xXzlpNwgwf+EyoMCDQSC36zcNnQw?=
 =?us-ascii?Q?lHzSX8spy+NxHpIt028jkGsWahIxNgczWQ+eODFoDvvNlERYe8VJ5z1ZbqQ4?=
 =?us-ascii?Q?eEyd6VaXx2JTIB8Cq9kcn3Qa7VJmpFxR0xsTvBuU0ssxwJFBqkFMtNrlY/+n?=
 =?us-ascii?Q?ECaKOKqrUlxbIbvXqd0JrkqioL4ChgFdKLR77jFUTqHDSZwi8H/QI120TeZ0?=
 =?us-ascii?Q?feODhLpTH85nVBpFL4x+lPJ+bB52W/BMoUEmFjJlLmJLbBgvv6XBvKDiixNo?=
 =?us-ascii?Q?GOfBUdNJlvGzxygaK7v27DwoHHdJC2o0ZC/M9qfRXY4gbTh4JuRiiiZspojl?=
 =?us-ascii?Q?bShZlcnuhu50G/5Vcw4JsmviaeqCMzscTnQk+ONjabTjyk3sgsrGuUl//3YB?=
 =?us-ascii?Q?/d/VhnPmoVE6qUsGMQ8NItC8oY42ZbKBHdCW75w6VWHZ4XAaNDt+dHgtCFLR?=
 =?us-ascii?Q?hmAy4+uuQKs23x5OJgAQ5RBcNHRYzQnv4ih6XjbKVdnWagpWUft8hqsxUrVL?=
 =?us-ascii?Q?de4vBtkGi6eKbszLT5uzLwuOUF997vVIIK5bSbD6P4aQqR+SFj47cIDVTWUQ?=
 =?us-ascii?Q?Kt0OKnwd0SaiOOgj3W2vqEp5FuvPB3aN6TZV1ZB7AvAE8FOsiVrpbYbKozJU?=
 =?us-ascii?Q?0sjQMtFEU6zYmsL9WothnnSyyb7+m6PRAx27fTWMigCwP5zsoxkbDKAgBzfN?=
 =?us-ascii?Q?/J9DTsJND6e6VLDnbQZrbk1mjEtLXDteScTWJU8aZiPzCD6omv3avNjdnX4X?=
 =?us-ascii?Q?00lzfvrHhknoWPygrBrGwVbPMTRsddyDyFKAVmxeiGFQCpnC9V7UOMRh0jUT?=
 =?us-ascii?Q?jzitKYNYFKTOUoS504N6XJDC5ERsmRrJC0LE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+5x2EnadPD2plDRIbwJ5VzRNliFVWTkHXqt5uo6RdZ6kOTQ9g7a+Zk6ft9TM?=
 =?us-ascii?Q?9wMcasL6BvqFDgHyXVI2IUAbWHAndYfQNCNZRamAkaA82AcPZGKjQ4n0er9C?=
 =?us-ascii?Q?OCxIBWZ6EhZCaADKEuB0J5cRZAe5/Phc1sbtfjIiM1WtHS3cYEydqdtrxqVD?=
 =?us-ascii?Q?sUb1WLYpDYbSVxgawgbJbJm/iiSRHggaGXLOYwXnzWHrYgg5bZLomq13zlHr?=
 =?us-ascii?Q?QQJFRlA1R4Bg2RjzUisd/kyhvWrb53j+Bi4duUQrybwj8/tZOLeJJzBEKr7r?=
 =?us-ascii?Q?B+eGJ2+opLV0eVK2VcOh0v12KHFnGR+i0vEuEVC9chcyOb2pgT3ZiWiEQhkd?=
 =?us-ascii?Q?bcinzVzhdUWJ9Wyav4MBDKhVXoWLw7aXngc34nfkJkI/uRXdmF8BSquef06c?=
 =?us-ascii?Q?7X1CwckFI7HlzaY2VoZ82u7dYhs6qPoz+9aVo31/NnCefAl8ZVYyxz27AWNL?=
 =?us-ascii?Q?4igOYody1zBuTzfKxXvVcQF0oMZaohDkvWjiNYFIv5Wu9jdZkFhDRu4X4iE2?=
 =?us-ascii?Q?64lbgJBCUEV+ryjpdT4Gi/dB8wYKQB3B0kK2/6B86MF51meGghJOpBPcdNgC?=
 =?us-ascii?Q?1ag2ysv0uKmE2oun/ZbVN+TmBtePKGWxY21+jCkltbzgxnd/4hpP1Q8b0S01?=
 =?us-ascii?Q?y044m0zlM2rrquBX5Fc8HcBxiusmvfDY9Hx2AHB9k0yT50xbAmauEhuzWyTf?=
 =?us-ascii?Q?3D0BL2uEuSsfxRxB46lwuymX4OILLxd4pq6B48l+wCtGB76PkyMY9MILzBbe?=
 =?us-ascii?Q?G+Wi+j13wqYKiapVrbPE6lN45oSC5XamcSn6I6Q9d3C8OepZpVtwckwBXuiX?=
 =?us-ascii?Q?088hZ5If4J3hmtcxpMe5eXBZbOVJJe6kYevCkxI0Lhs602L71rxtFzj3sDT1?=
 =?us-ascii?Q?GZq1gS3FKFTeIMyKWxuiNEeu8c+WO2vHI7132QTh7KFV7CDBMK7e51jBERAg?=
 =?us-ascii?Q?lW5upwtql3CiWe9eYlQsTMMw2gtEkczcxFfM18B5xNUHrG62BL02G0YOjiKx?=
 =?us-ascii?Q?J0CLWy/MclCBcMfq9mXIc4qiMFp0HBKa5EWusSx3u9TS5dw1rL7LmUT3y+5t?=
 =?us-ascii?Q?856rOafCgYL7TMASyN+t2/5eqVuAZQNUul8HhHnfNfqpraT53QySOhAS+mb2?=
 =?us-ascii?Q?PLRm1DvmY202LVoN1WkZKKEI7Oiin/6bSXVpyc0bcJx8bbiCTHRvjuQlMaiw?=
 =?us-ascii?Q?v/k9n3jDWD2Bv3Po8xA2G12Qhsqkrs199RjjD5KdBJYHwCnn9qNMAsJE0sXZ?=
 =?us-ascii?Q?t7D6vgYrF7ELP8wYhwKeL30Qj2vhUgUCBU7K44JRuUmu8bKsX/D9dN/0rcPy?=
 =?us-ascii?Q?yCfYUYD4GrkBSZVfByd7V++XgQa4+fAokriww7MdmIL3IDTJSQercIXpdQ57?=
 =?us-ascii?Q?QqHdNXX0ReMZwbBrC6897J6y7JXdNwQULvUih66q+jvrJiWE4IdENgo8zF6U?=
 =?us-ascii?Q?YoDl78AYXZFwZgBypwuExgZBTealf++8KLN6qJi3HNub9/8C9h60xLdCCSO6?=
 =?us-ascii?Q?pIZTsn8ocyqMhcWwH020wSTrvnQICR6MobKZCBpZgglH4w1VUlVrdIFwNE8b?=
 =?us-ascii?Q?ttuSFE2H63B772Lyzsg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd489fe0-6428-4a91-6539-08de395ed5ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:14:20.7223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Cstlg73eiZv1gbGdnx2X2ptc+sa0aHMwhrZYogtGSlgiCJaM1EqpuyjO29rRMzIPAtvlAZ4Y/+RrM82XabYSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7488
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

With the suggested change.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of B, Jee=
van
> Sent: Wednesday, December 10, 2025 9:05 AM
> To: B S, Karthik <karthik.b.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>
> Subject: RE: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test=
 patterns
> to framebuffers
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Karthik B S
> > Sent: Wednesday, December 10, 2025 8:54 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; Kamil Konieczny
> > <kamil.konieczny@linux.intel.com>
> > Subject: [PATCH i-g-t 1/4] lib/igt_fb: Add wrappers for painting test
> > patterns to framebuffers
> >
> > Several tests manually create a cairo context, optionally fill a
> > background color, paint the standard IGT test pattern, and then
> > destroy the context. Add helper functions to wrap the igt cairo paint
> > functions which can be used in test binaries to avoid code duplication =
and
> improve readability.
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > ---
> >  lib/igt_fb.c | 38 +++++++++++++++++++++++++++++---------
> >  lib/igt_fb.h |  3 +++
> >  2 files changed, 32 insertions(+), 9 deletions(-)
> >
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 0a8299d26..ef16fafb9
> > 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -2017,6 +2017,33 @@ void igt_paint_test_pattern(cairo_t *cr, int
> > width, int height)
> >  	igt_assert(!cairo_status(cr));
> >  }
> >
> Please add documentation comments for all functions.
> Apart from that patch looks good to me.
> > +static void paint_test_pattern_fb_common(int fd, struct igt_fb *fb,
> > +					 bool fill_bg,
> > +					 double r, double g, double b)
> > +{
> > +	cairo_t *cr;
> > +
> > +	cr =3D igt_get_cairo_ctx(fd, fb);
> > +
> > +	if (fill_bg)
> > +		igt_paint_color(cr, 0, 0, fb->width, fb->height, r, g, b);
> > +
> > +	igt_paint_test_pattern(cr, fb->width, fb->height);
> > +
> > +	igt_put_cairo_ctx(cr);
> > +}
> > +
> > +void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb) {
> > +	paint_test_pattern_fb_common(fd, fb, false, 0, 0, 0); }
> > +
> > +void igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
> > +				     double r, double g, double b) {
> > +	paint_test_pattern_fb_common(fd, fb, true, r, g, b); }
> > +
> >  static cairo_status_t
> >  stdio_read_func(void *closure, unsigned char* data, unsigned int
> > size)  { @@
> > -2277,14 +2304,11 @@ unsigned int igt_create_pattern_fb(int fd, int
> > width, int height,
> >  				   struct igt_fb *fb /* out */)
> >  {
> >  	unsigned int fb_id;
> > -	cairo_t *cr;
> >
> >  	fb_id =3D igt_create_fb(fd, width, height, format, modifier, fb);
> >  	igt_assert(fb_id);
> >
> > -	cr =3D igt_get_cairo_ctx(fd, fb);
> > -	igt_paint_test_pattern(cr, width, height);
> > -	igt_put_cairo_ctx(cr);
> > +	igt_paint_test_pattern_fb(fd, fb);
> >
> >  	return fb_id;
> >  }
> > @@ -2319,15 +2343,11 @@ unsigned int igt_create_color_pattern_fb(int
> > fd, int width, int height,
> >  					 struct igt_fb *fb /* out */)
> >  {
> >  	unsigned int fb_id;
> > -	cairo_t *cr;
> >
> >  	fb_id =3D igt_create_fb(fd, width, height, format, modifier, fb);
> >  	igt_assert(fb_id);
> >
> > -	cr =3D igt_get_cairo_ctx(fd, fb);
> > -	igt_paint_color(cr, 0, 0, width, height, r, g, b);
> > -	igt_paint_test_pattern(cr, width, height);
> > -	igt_put_cairo_ctx(cr);
> > +	igt_paint_test_pattern_color_fb(fd, fb, r, g, b);
> >
> >  	return fb_id;
> >  }
> > diff --git a/lib/igt_fb.h b/lib/igt_fb.h index ac0e0909e..8e5907dab
> > 100644
> > --- a/lib/igt_fb.h
> > +++ b/lib/igt_fb.h
> > @@ -210,6 +210,9 @@ void igt_paint_color_gradient_range(cairo_t *cr,
> > int x, int y, int w, int h,
> >  				    double sr, double sg, double sb,
> >  				    double er, double eg, double eb);  void
> > igt_paint_test_pattern(cairo_t *cr, int width, int height);
> > +void igt_paint_test_pattern_fb(int fd, struct igt_fb *fb); void
> > +igt_paint_test_pattern_color_fb(int fd, struct igt_fb *fb,
> > +				     double r, double g, double b);
> >  void igt_paint_image(cairo_t *cr, const char *filename,
> >  			 int dst_x, int dst_y, int dst_width, int dst_height);  int
> > igt_cairo_printf_line(cairo_t *cr, enum igt_text_align align,
> > --
> > 2.43.0

