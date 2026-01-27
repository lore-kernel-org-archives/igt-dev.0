Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAEDC88E41
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4DE10E4F9;
	Tue, 27 Jan 2026 09:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYM3ydSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154E010E4F8
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769506288; x=1801042288;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cXWGAD+7RFgsGX6mxpGlJqLRhUQBSVGrWpU7oB9gqOY=;
 b=NYM3ydSZevKxORsN/QA5b8PXchHL6Fszo4A6uAGHlrpHisRlc4JbI3bD
 /gS+vugXcuo5DJEWNbZdXHRO/Me9xI59Ihw+/R03TNcP1CP2iU7G6MQ9D
 0IWsG7BdqGW9DuVlCBgo3CdKoGiHT3dfoSqo0G/r/N5jaAy0PzCtX1Nfp
 PgKmRxiFiwRsFb+S77Rd5+9iw2hDeX3QoOHFX6xa39tWpMUxyOx3MHAa4
 Cnz61ACOF7fYqYjpYRhIVagQHJpqx7rmaNySjsa1pUFReYWBfUFhZ8EVe
 Yvxa6auSy8cuq+4D74TdXkpMKzGnvIryuWI/RH2bJDdPJQ85Ptr6D36BQ w==;
X-CSE-ConnectionGUID: L5qG/dc8TlG285h95vmbLA==
X-CSE-MsgGUID: q1bMgXEJQmGkEWe25gtRtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70590738"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70590738"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:31:27 -0800
X-CSE-ConnectionGUID: ZjU/6t3TQqiSmZ6hSrfsQA==
X-CSE-MsgGUID: UhknAtjhS1eb72t56pWCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207727621"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:31:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:31:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 01:31:27 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 01:31:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckESl0uYXvCcZJglIvGNUQfs4AqlbCba5u3YYV8/U6/yQ9JcTTt5FxG4Vmjz8Rbu6ekz7v+dULRjj5kTHehwbujOzHhSJyeVKZKW7wlTCKJs40KpNieqzGyrtW8RylKBU4ldUmN4SmVy37x6OixmeUIzH6E+uSMLERbK1vwLTCwddeGkv9tQMtAC6Nb/rgTYGqcw6i1r1f3CzBf3NIzAbVZw/MOHDmSCysHqu+tIHjumWvomzxWIltEr1uy/jMdHd+3baglsZghmq1OGg9BYk2v3VofqZeyLm31tj+KT1w7QctpGry/2KHZ+OsdZx+AqI8NzhXRNoi5nHNsoLD4Pow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+s/84l5aCfbUYsrpdBTL4MvF/CRN44Wh/7kWu24Tu6k=;
 b=zFMIRephr5I7XxprBWWwldC2WGsTTBtoTYt03/tbDP9th+4a5WckpFpHil4HJFdMzLDqRd6JH/vq1Xwb+zB8TXRbDIMVE3cOGZGzi/oGd7Vyqvn+ihdE9Oriz2O3oi6GbHwTLKgI7bIJrjIj5xzHqIIqwSsbbAzBwbjzkgk3Z6Hn4G1mxpoo2BZmpoNtpMQvAAPe6uXo/9zx6I/afCvrEgSHKNmIorNlvZxmzDaR9jZlC4SJn4XGewZ7R4Aig2p1Ibl8k3uQTsicR0dddCsYSBOKaFy6/O382cDQwq7sgJeeroqbU383y+DXulrtxgiDdCaBo42rQfH+qmCV4oAqmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB7251.namprd11.prod.outlook.com
 (2603:10b6:610:147::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 09:31:25 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 09:31:25 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>, "S, Sowmiya"
 <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "S, Sowmiya"
 <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHcj0MoSBvGPftozUarcvwWXZXNAbVltZmAgAALFnA=
Date: Tue, 27 Jan 2026 09:31:25 +0000
Message-ID: <DM3PPF208195D8DB22B278DC6A01EB42544E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127043233.254107-1-sowmiya.s@intel.com>
 <20260127043233.254107-7-sowmiya.s@intel.com>
 <MN0PR11MB6034A3B5821AA60936C59C8E8190A@MN0PR11MB6034.namprd11.prod.outlook.com>
In-Reply-To: <MN0PR11MB6034A3B5821AA60936C59C8E8190A@MN0PR11MB6034.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB7251:EE_
x-ms-office365-filtering-correlation-id: 4043fb1e-ab1a-47e0-6d1d-08de5d86d747
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?qyxdLvEWUadgaA8940gkFUYPEQ8zonT9RvoUzN6ykh8h8I+FIkGEgT3+jg57?=
 =?us-ascii?Q?TuCDeUPF8jOrT5mpyQQ48plHRfpV63i+HXfNlGqPIFVDIVhTAjHdNJ9Xtc5M?=
 =?us-ascii?Q?ODApJ8YTmiQ6YvL68HAU4fKItWnWdq6UOrySbBiiwPx1deLxlxxVw7ZSzEgZ?=
 =?us-ascii?Q?AVVPN33XNxp2WHtJPe0ccsDN49vneWOE9mX2GvJXAkf61mWu4TI+Wh6xgqfF?=
 =?us-ascii?Q?oBqqsCRh6qcFZB1Lq+XdPnveCo9Z8cpCjIAuVjRM5XfXRK2G1DVGPVj3920b?=
 =?us-ascii?Q?GcCJfqM3qRHBFe3sKvOFng6Wl3YVQEPnTFdGnsU/pi3WbgS610HyEnycCjFk?=
 =?us-ascii?Q?xDS44Oq3WcvNpN9JROAxLkGAoGQQnynOs1ib9pRbDq6jEUA6J5DkEnsIHu1R?=
 =?us-ascii?Q?TMbxFn6m3P3CoxRkcb/X5qvYHb+2U/3RzFfrn4bH2syPhjIY7pR+EmVOUfMs?=
 =?us-ascii?Q?emNe9GL0pYi1cXzlqKXYoJf3bFMQwRqX/ITb8YDPqV7PsQIStaDUyoFaFiQV?=
 =?us-ascii?Q?KyKXvfOetx00e/wuxkxFyBMJVtC7keG88oSPFk6xdl/K1iy9twX4lKWwG0cF?=
 =?us-ascii?Q?Fup4Bu4uNVRZtwb1vahJCdiwfKkE0DcmPvqCR94yk2T7n/ufUS9P98yW7/3o?=
 =?us-ascii?Q?4kImlf87lG2WYauqgAJvK7YsDspZLDY3Dw+OhkPdFGd+XywuwmZzb68F6QCB?=
 =?us-ascii?Q?zmH1nqKLBjpBq6e0oFZrEJVlFWtKV/waOjWZvbs13rzqqDazHosOGdQTzjp9?=
 =?us-ascii?Q?pBFuzbE2qWBGTjdNDcavo/8V8/AIgEZ6Qeun5c1bq6vWZvGaJGXo4f36P9p7?=
 =?us-ascii?Q?+H30CTNfRfLHxb2CaKjUUEJ9+LKeJz0ghI5+o5PlHsZp3Mzj5ljGuUBnheRd?=
 =?us-ascii?Q?kfJs86bsLEVbvTcT52mGIOoNu5H+rkddA7FsvUqeVuSQV806EwC2Ib11wDeJ?=
 =?us-ascii?Q?OGyu6UheKlm8hzyjYJWyW88YmaYZSdnBQMhF5qtRX3X4Iwxd4UJPBQPLVj+R?=
 =?us-ascii?Q?XtRD+zYfBLtuEZ4c39qVah2Yv984MwhvpPjrQfjLIbJ3xSOwF8tKZ7LKkRPc?=
 =?us-ascii?Q?c/1vSXhng+GXPTAzn6p9c/a6AHngO5uq2PkDSgcU+Y4IUnCTYTH8eocA1qcV?=
 =?us-ascii?Q?geeqV+A5OpE1cIdNiCWy4U3EeESERjlTK+VZhijrf2ahChMlvnwY+C6Hs2q9?=
 =?us-ascii?Q?OMmzB3tFlKG0KtH902tGD2oYt7+cHRFKXmg7c29lTFUudTQkhPAXBgCPltUk?=
 =?us-ascii?Q?Ad6RXR4UM/zGvSJKwn5RtHleBsdecNsv9HmQKoDluVHEJxnbjU1e3H+sYrLn?=
 =?us-ascii?Q?SYgbi+Go+TTSggxHtfBg+4rvc2LMH+DGiQ+A15r9QJG64CGiHPnGNmZHcjlQ?=
 =?us-ascii?Q?q9SHc8ZhDNnyn8g4x942u0kzjiMCVMRCjNbh5lCynVSJX0OtXkKpGKn6Kt5U?=
 =?us-ascii?Q?ibVzPkhNRvbklOY4D+tCGShr0ls/yetPfV6s4Wx6g3MWelMFr4Cep1fbbU5R?=
 =?us-ascii?Q?2brOVHr2DXIR6Rb6/bJf8IrhuNt6UIPCTg1UacqUGHSMusdUZ/Xa1JHY45+M?=
 =?us-ascii?Q?tT46ht+vrfSYg9q8+uGaSchYk+mkIoX5Txp2S49jAU8kJbGIvEZAUMzC7Fqq?=
 =?us-ascii?Q?rUwe1/Q//MHs0s+4caN4h+Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dVJl1H5yLp0TCfTG9wUV8DMuMeMT3fgFfZBVCJQR129DFcT13aJo0r+zQe9e?=
 =?us-ascii?Q?7rh8fpSjfrnwcV82yDOAEeAMCIabN3Anhf2Y6j6KS2+7JAiqQLwDsuSVOJ5D?=
 =?us-ascii?Q?C7OEHTIyxWE1HBU8u3zYZw0k4ch25jQ7pOJ/SBOTMe0YqUzFhfKdOZlvrMrD?=
 =?us-ascii?Q?A8ShypHvVa5qhZbVNZxY+KAkYCqWLwKnOceEhh2cYbYrXrXqiE9CznSXFGyD?=
 =?us-ascii?Q?592i5xsQIoNtZc4MMrWmCVpsGrV9vXJ46QHokR9DeKhjsX9GWD+9DddKwErL?=
 =?us-ascii?Q?tYVdXPysKRRk/6EY+gtZjonsD9sp/fSNq584BCqYLeginyifaSOeQcf8XDa8?=
 =?us-ascii?Q?t+ihoMRq21RTJTsG0GAcIa9Ebm6ubE+iLV1EHNuWHerqwRGFqyKisuyD5T6X?=
 =?us-ascii?Q?H/g72ltk/qHXWoK8EkXaRS/b5AMvw1S43m27Xq3ty1HiHe3MyTyouU1VFLcs?=
 =?us-ascii?Q?5fMvCrxcT3/G3JgkkFocdKw7IljzZe4KOv20qG33gOoH6FtzorVDHWopd/pU?=
 =?us-ascii?Q?TGUqsifeZ+iUnYEqhWtNe2IuPCbDzsZK7Ygw4/3/+yT72/RrHqFE8GSVhmqW?=
 =?us-ascii?Q?YzkYx2XWSq9ZpAaziTpEfuUmgyeJY17e/0FU+eGBdRUQohORVwzj0BWUq0g8?=
 =?us-ascii?Q?0BKSb1Jbssw8ACTgVKz2DXiEKDiuFFkzIRQM4FzKtPxRMJbYPtEwfyIyc07x?=
 =?us-ascii?Q?sYTetIrnpV2zYLb4XsHayL3T74daamtNOLLx9R1fzvWwQWxEfIJnNSSsd95W?=
 =?us-ascii?Q?DNt3+AkiMI1oq94dTjZqG7Z9sPhvlnd+hLnG7mW06/ScN6nbi1dvVl7n2NyM?=
 =?us-ascii?Q?IOjQ5GFcr0uzeLLdOzS4qI6V0FYrMWJcIx+nHEtlL+rQd3xFDidjH4Kh6Q1O?=
 =?us-ascii?Q?tsYzk/Uqg12RPxvbfuDYo+tVlhGKRQ9IzU810MjXD8QZ9qGFopuAcjkQzmc/?=
 =?us-ascii?Q?rf4JjkbvzaNEfVnoLoli4NDDIFSk8tme2xrcgYHT6XWE83DSRljsEZxba4H5?=
 =?us-ascii?Q?zDmEo+ro40mODXnEdkDfqTteJKEul0bKEaEzSAxjZ6NVPWuqODz+u6nW892e?=
 =?us-ascii?Q?RuJDwrAtMlQhZG6c0KZuX/yaxXNFYHLt2ASMGF94wClE8xy+7tPz8v2bw1mj?=
 =?us-ascii?Q?sfsiDFUjyPH0bOMhDmc+o6do9TwVxNJt28Kms7Vz3pOSVEv1v4bbH1YQN7Ak?=
 =?us-ascii?Q?TeyUTtWJQqK5aPjhdfnsSiLbMxPHrcFTVcVL+B2435qMm541vhIqenqurmNI?=
 =?us-ascii?Q?Sw6yeqK8k1dwXUa1sq58ODO1KavYgjScGwwl+sJSGAzBUEikpFKz/1KTsO6H?=
 =?us-ascii?Q?u0qrWBxKk9QgFJOzTOg/1PVnsQYsUh54e5H5uET0Oiu3GBkmqA9eblpIB28/?=
 =?us-ascii?Q?1drAIAReHdpe03G6n/Yr94CPP6+WRJEpPaNU4FzWEpkPQfeZyKob1hLnzGXU?=
 =?us-ascii?Q?1bSySduo+g79d5msNVsDh+Gz14WiEjZrQXkddQTu8iSBDQ/tUWZaEPV6cWy4?=
 =?us-ascii?Q?rV2mIArdVjL3f7Ji/BcKysACD9GDHJvKW0g7vsfW5Y+hKYjeJunQQoYRPMFp?=
 =?us-ascii?Q?qGl+B4sRYSSD0g+OYio6JkXiIjvPpibzfN0bvSiuQj8yI1P/KSzxazgdxxif?=
 =?us-ascii?Q?hYZXNFyM9MO0yLSkxDeujHQ5KGY/FHVSG1jawILV+iLFDObEj5lD0GXkOqww?=
 =?us-ascii?Q?GNV+4ZPfEw68SO2CVPlTmCsGfLhLRzrDlCJ/RyCDWmBXa9unPjZYKKeD3HJ7?=
 =?us-ascii?Q?3uQDJ5n2vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4043fb1e-ab1a-47e0-6d1d-08de5d86d747
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 09:31:25.1512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXpG7PsFAXJmKwdLHYLS5/0ovQa3KVqBnIxO0l4v6miCu744p5g4bn3+zOaGMivN2UUfowy7709IVs3+7VgKWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
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


> Subject: RE: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor writeback=
-fb-id
> subtest
>=20
> Hi Sowmiya ,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Sowmiya S
> > Sent: 27 January 2026 10:03
> > To: igt-dev@lists.freedesktop.org
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> > <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> > Subject: [PATCH i-g-t v7 6/9] tests/kms_writeback: Refactor
> > writeback-fb-id subtest
> >
> > Remove individual tests for each format for the test writeback-fb-id
> > and introduce dynamic subtest generation based on the formats supported=
.
> > Framebuffer creation was now part of the subtest level based on format.
> >
> > v4: squashed the FB creation function with this commit (Suraj)
> > v5: -Update dynamic subtest documentation (Suraj)
> >     -Rename input_fb to in_fb
> >     -Set plane to in_fb and remove unused input_fb as an arg to
> >      writeback-fb-id function.
> > v6: -Remove in_fb inside subtest and reuse input_fb from
> >      fixture (Suraj)
> > v7: -Join nested if conditions (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 56
> > ++++++++++++++++++-------------------------
> >  1 file changed, 23 insertions(+), 33 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 63917bf4f..58118b8da 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -51,9 +51,6 @@
> >   * SUBTEST: writeback-check-output
> >   * Description: Check writeback output with CRC validation
> >   *
> > - * SUBTEST: writeback-fb-id-XRGB2101010
> > - * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > options
> > - *
> >   * SUBTEST: writeback-fb-id
> >   * Description: Validate WRITEBACK_FB_ID with valid and invalid option=
s
> >   *
> > @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options,
> > help_str, opt_handler, NULL)
> >  	}
> >
> >  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> > options");
> > -	igt_subtest("writeback-fb-id") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB8888,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > -	}
> > +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > +			uint32_t test_format =3D fourcc[i];
> > +			int bpc =3D igt_drm_format_get_bpc(test_format);
> >
> > -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid and
> > invalid options");
> > -	igt_subtest("writeback-fb-id-XRGB2101010") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB2101010,
> > -				      DRM_FORMAT_MOD_LINEAR,
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > +			if (is_intel_device(display.drm_fd) &&
> > +			    (!strstr(igt_format_str(test_format), "BGR")))
> > +				continue;
> > +			igt_dynamic_f("writeback-fb-id-%s",
> > igt_format_str(test_format)) {
> > +				igt_fb_t output_fb;
> > +
> > +				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > +
> > get_default_fb_format(&display, bpc),
> > +						      igt_fb_mod_to_tiling(0),
> > +						      &output_fb);
> > +
>=20
> Framebuffer created before skip checks. If test skips,
> igt_remove_fb() won't be called and framebuffer leaks. Suggest checking s=
kip
> conditions first.

Good catch this needs to be looked at and fixed !

Regards,
Suraj Kandpal

>=20
> > +				igt_skip_on(data.dump_check ||
> > data.list_modes);
> > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > +					      "DRM_FORMAT_%s is not
> > supported\n",
> > +					      igt_format_str(test_format));
> > +				writeback_fb_id(output, &input_fb,
> > &output_fb);
> > +				igt_remove_fb(display.drm_fd, &output_fb);
> > +			}
> > +		}
> >  	}
> >
> >  	igt_describe("Check writeback output with CRC validation");
> > --
> > 2.43.0
>=20
> Regards ,
> Mohammed Bilal.

