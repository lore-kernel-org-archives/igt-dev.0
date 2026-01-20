Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FF2D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7721C10E58E;
	Tue, 20 Jan 2026 09:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gV/fwDqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7559910E18D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768899997; x=1800435997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dZVNHHFN+HVDAYV+ZVWQ6eBihuGa9VBmpOF4rN9JdxE=;
 b=gV/fwDqX7XIHlZGmfC1qeDIM0hkvQA/9j8DyYrwLmcuRGf5HT3zwIcO/
 UWWEmnOZaYeMOHZqnA0d/g/xICBuyWu929lcvDSPnpFF5FDm9zbqtt2PZ
 9+ThCiN8LPxbVBcvd48U4moOqLbqY9Y6aJJKJuzen8jivPidB3N4nsATW
 umJAVTMUmKdqIYHyrPa+DqLJI8RVZN0i2mcYmKnk2in6QiTF0DaZrhWCe
 21V7vxEVh/nUFK/SL0swGzdsN7c1r2pCh4u2f7WkfO26IHDOBGnEIS7Ag
 pYx28z22d537SfkvI2GLtMNuMdZx/9R/W+SuNx61hSe86jtz5CJHcqi20 g==;
X-CSE-ConnectionGUID: Ia9hmlBKSRyCd4YiPu205g==
X-CSE-MsgGUID: XAbHBhVwTZ6wU9Uq+W+JTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87684997"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="87684997"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:06:34 -0800
X-CSE-ConnectionGUID: U1OC2793TDmFWMtd9RF3ow==
X-CSE-MsgGUID: FQs+HQA/SCuF2xpNnA3/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="236753871"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:06:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:06:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 01:06:32 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 01:06:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRu13XSq64V3pV7kvtcd3I5R540kbA6MQ+aFAHkf1p1QRz/icR19OZLl4puStofqsGmVE4zuJYsQyA0SHg+OHhgPpos+lE78P8DJevCNmKB6D8Cn0Gn8m9ETWDuX+Rms/6oEGTQ8L7sGsmYq+b7V5M66zubI7GloQxfdbNa4RrtgZEqvG1nIX0f4RXGqRruUL5uRbO3kHxIuU9rmT8bA4IBnbY53t4uVX05QkcHwsvDj7zM50W9R6BFMbzLSBpGfMiC8rCqEzegrNYe2sTNcBc6/VYvCExCRXawPxfQKD68jU85eJzGYeQjR75ZvNbSIbDzy+cC5XkWk/SxacOxhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpis73bJkx8ncFTttx4zlP2BxamUDgxQ2Bti/pA5j4g=;
 b=UYBJllFe5Ni4W6gR6viw9E9rJlN6TqrhhU5NqQo5eNOa+C3t8VPoeilqPL/2fvvMkZKQTiZ7WIDgSYPjpOnU9tBZUupdHWDUeev/uekZyNzfWCe00GFvuSavHeddHkft1PTIUjyLUnzvfrXb2BR7Pl+OvGUdpJ9PvTli7qb7DAE396yTjukVxybxOaIjlE+cD3IT0m4Mrdw93RzPt0lWhnGX1toyslPV2HY1KFVH43HLtb9Ff04QqC7PJh7OQ3klw6SVnmBHsrgxo9cWqDvhXvSuaY5kGo/hL9vDXN7fSedyrvHbLDiByj7LB4WmJPpCSnfTpPdmUi27GVtWou32tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH7PR11MB6498.namprd11.prod.outlook.com (2603:10b6:510:1f1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 09:06:30 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:06:30 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Topic: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Index: AQHciP7aWUr1RlCn90aP5PsPaYbFarVY8xcAgAHRxUA=
Date: Tue, 20 Jan 2026 09:06:30 +0000
Message-ID: <PH7PR11MB679696ED8DB85D5DA8D0A167E589A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-8-sowmiya.s@intel.com>
 <DM3PPF208195D8DAD4CFC7201483D8E1AABE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DAD4CFC7201483D8E1AABE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH7PR11MB6498:EE_
x-ms-office365-filtering-correlation-id: 2bda8b91-c3db-4004-54f8-08de58033380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?A+NePJQ6c4MH7nezFmd187YXrs++DA9Zou1d8uNF9MhJTliyDC+oNNxS8X3U?=
 =?us-ascii?Q?AbXS3kXptqTnNyrMhkCDYUbFVt0yWKtM1dQWG+GqguuhNN0w//8YwkO251gY?=
 =?us-ascii?Q?ZtbBiC3Wqp7dm/s1PMK98imWzhDK4hCxBLznICvXP8OayETL0jmRYByaMmk5?=
 =?us-ascii?Q?ygs/bmicWSFLOEM8QcAQnZGaHZ635iHdbv8TBLf2Gcd/BQxVgfNt1w6Yvwfk?=
 =?us-ascii?Q?2ZkFTkAIZwHGomBd5I0EpaMW5C5KYdExynsnntgsXSWBCkxZA/WEkGkTFE+D?=
 =?us-ascii?Q?GhPFDe55Qp6Ub3jzETYPVpBJPWxDv+Jj4NY4cRj+NEQ5HaEyqakeNFStX5FO?=
 =?us-ascii?Q?dhOoG9oyXEZ7fHALhLIlCTSdxD1YPJk3e1rlYgMefYg4A5eDnzijZ52W4Z8p?=
 =?us-ascii?Q?y6j5Zp39kpQQomng1pef32jKO1kgXwSKQja6/ZJNJbm2pb4LSbO0xeJUuxaZ?=
 =?us-ascii?Q?r61AMH9gXjLmczlO8FlMIM6+SHVUBOFDqTlTZltYNnAGpSX6NMIoWz5e3FfD?=
 =?us-ascii?Q?wra+7j2dazAlwetkIvaNtR6Ta7epAEFgxoFzvqk6TtiyKjBjjXlEwbSq+C+S?=
 =?us-ascii?Q?ihHo/EZRmTuB2inNYEYz/9wnoz7ULIZxB+NTKIllELAIu218e+Jr1A7qD1XI?=
 =?us-ascii?Q?QyZM7mXGeh8NPQA2O/I9U/8lesrnytNsXh2v2k0RrvcZPBH54b/nYoXo5MSd?=
 =?us-ascii?Q?vFWQzaTT2ZdGy8G/RzIqA0ToTxJKJIBuqtogDXZrzXF3HjKqcyuhB/+Hn1L1?=
 =?us-ascii?Q?aBBrefKYwrGfKIomgQsj42jl03g4OtZLeLRJ2riQiBH3nyl0mCRfrL9ydWBC?=
 =?us-ascii?Q?zCL0YwVVFDc5rHf/pqVSkG9IkEhd0ycVrTLmlSl9LytJ61Ya5tSe1JN3bopX?=
 =?us-ascii?Q?S5O+e7W5urFXz+QTYwIKJaEQFm0VJQUNFUZpuwrBuVU+hYAhJcFrsPyG76sg?=
 =?us-ascii?Q?EPCDqPs4fwLgf0F5EehB6bkOTkDSntevboU9Wr2+IshOIePjUxw5pQqm6pQc?=
 =?us-ascii?Q?6Tzf5VhCN6XTdhfyglFmlRXVzB6Vq/ukxrzHRxYOBYOomy1GzLJQMIvBR8QJ?=
 =?us-ascii?Q?K26Q0kRkeIVD0pNrK/RhDhSQncVdk/lX/gb4yDuYNBXLZNqvkCm6a8LzsQW2?=
 =?us-ascii?Q?xhdvbrpEEyd2OIQOA6gXpkG4pigf9vz0CBAiFO7757vWNK6uKbyqTs1l7lU9?=
 =?us-ascii?Q?3iCRf3uRnrjgj7PpzksxMBtEacUR2zNjIle5K5pSttvSX+nNVurGr/28AKRi?=
 =?us-ascii?Q?styKlgEm4jvxsAgEZ4RVs2T8WiA2YST2hFAP3+nfTRoEexcDViT6JqOis3Uu?=
 =?us-ascii?Q?xFdSqdkHh0z2pc2L3tYyzUxXBSIMdGTN9TdtWp6FhqcBI/eQeTDUZ9DD1Uwh?=
 =?us-ascii?Q?Tch420mz1WZnPBaUwOGlN/wDFDb/lavSvI0JoPGaOCDzQPlEcVj3yOd8UZ9Q?=
 =?us-ascii?Q?NHbXaU7jAoBkhfYZTzQy85ONIX/ph+wmsVKapsXoEVqXl/5L27kDZCbzYyAa?=
 =?us-ascii?Q?Cb9k8K4tf8iT5mFdP5OzTw1zyDbOPOIISQPlcZ71EMgvCvjAbEMM+PmwEyjp?=
 =?us-ascii?Q?PVXqpHo1+DSTjxN7b7v4HsFkonRwccN7W8F5gpl+4Eb9rNeas1il8amsBGqT?=
 =?us-ascii?Q?YBXE7i+1vdQeZRo1Bb74Rvg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZpFMwMx7hR/4C1vw9I5smz1dwUyC9KZ9JuxbkrBU4UTvsBmmN9x+AHo4DruS?=
 =?us-ascii?Q?inQttslI6Y0xL+7xujp9bXsZWXvcJ1fxV1oPjcI+hjoJxMrQl+ugbNvSQe+T?=
 =?us-ascii?Q?DaljQKOi1IJkdMLmcqXXOwOFeyo31oyK722J7KhOpowdmvF+kDfG/jNd+xX5?=
 =?us-ascii?Q?n7LGyhhm9kSsYBQySNc7MP/HoLWA10Ij0XOc6Jo8xrdNWVB6wPHIWx6Z2Arq?=
 =?us-ascii?Q?dP0o+JkAIIC9KIvqGZ04hkpzgF4s9eP506BkUbvxX9vdf67WYiVdGv6I63H0?=
 =?us-ascii?Q?c7yWJTtkd+yPMApd1Ls5v9b2+UzbY1VncssWPNuxsGy8U9wW8sG+UVpYu67G?=
 =?us-ascii?Q?WM2649WAmHT2lwOht7qJr8JZgmojtHFItJXFiAUGWwu5ZQPlt+j5sJ/7Zs+X?=
 =?us-ascii?Q?mIA/mZIoJBM8eV9KOv2ULazLVQqj//7iRe7SjEuggeUJZ0myRmhhEy7EJzxQ?=
 =?us-ascii?Q?cVeLE29G5M5byaWN5yy7aBdJHlA4ptFsJ2lkKVKmcHCMzG6IRrKvsJM8TzKy?=
 =?us-ascii?Q?0zIX7kkf9oMjDFEM8NYxVDEY5U1ESKcqkiT11KssMvkwRbW6b1RMRLqh8C4K?=
 =?us-ascii?Q?GiE6NqrsWF65FwAoBFChMZu6ic3hqVisVmnGB5vfe4erCh6KXTivIRh65Loe?=
 =?us-ascii?Q?Vy/0CBINWIgrKQE8k3D4ZqtcPl7cFt0/qZctyKFf0Cz71219OJDL8YHj96TU?=
 =?us-ascii?Q?8UZNaEOWZ3NKjtiCtoHNkGdbBq4SEfRvwRMt3DB/ihNSNyB7KDk9boR83FW+?=
 =?us-ascii?Q?wNl68I07JLLE+GiGK1TMz3zz1ylRdH+4HsOPoPzQieUTZphVWurpdetz1Fb5?=
 =?us-ascii?Q?Ir2tQ/ar6ym4nFhf4uc6qa2oRZIwJyy6vdzpmAv/i44E5kORsiSn5XyrO0F0?=
 =?us-ascii?Q?6eKlVJSfm5VqZ8M/oYbC1y44Tc9kW/1gXDIrxvEm5MsPbvsfyjG5wonGlvmi?=
 =?us-ascii?Q?SQog2pHb9LjX7AXtirVOFZDy/vk11ltG3NLIldOrc4h432XIBIyq4RojSfFY?=
 =?us-ascii?Q?Vkp1gVCsw3YzFaZSo0L9Tm679QuQ/bIMW+TGQlxAtCWdTIEbYtHOlF6yCit9?=
 =?us-ascii?Q?PxnFIy4sPc6m9oQIk/IhGVk2RXbzLKDzWf/JlF8dULW11oI7xhnYRbb43Q2A?=
 =?us-ascii?Q?Xs5hwoLZJE4uM9ly6ueQk+DFgwDAqY18PrmYiS5Y8N94K0mcNcw0bNVnZqP2?=
 =?us-ascii?Q?dGuHaV9wFMK85EoHncbhSfn6SgRUXR59u85pGPIupGCS8rwZ9QYza5BA+Vll?=
 =?us-ascii?Q?vVM7xx0xx+Pm0wqb/QLZj5yNh/8aI9SwkN34eDkxQx/VNmTy2TdQqnQ6TTm3?=
 =?us-ascii?Q?SuuPd56BKWV/goSn44MbBMGLFp9EPqzpdv3ffHv89WLk1QweO+iMt3ZKbjal?=
 =?us-ascii?Q?WtKERbJHJsOU58qe79M4cNuWZcoXTQtzyozk9Bn5gIWMyYwTjT3SywM5L2Li?=
 =?us-ascii?Q?idQlFReOnNZAE2Nqvf0/twiRYX9iNvVFOsZIA7dHGsorsNzwRhwZRW7pM9zk?=
 =?us-ascii?Q?yywHG6U3ELNRmGBMVRjOmA+bgjhRAL3Yk1u78D39ENBUH3LO1ULqGU5RTK/a?=
 =?us-ascii?Q?l5Q9XmdMc8Jq6adfk5aWRTsAWMTTKhMd5uiwlgqagzd2ymGL83n62AT/TInc?=
 =?us-ascii?Q?pp0Zv+U2nQtCcZhKrKddZg1OLlYhhyT+KWNFZGSp+T1v8CpRRIIThNYjMofb?=
 =?us-ascii?Q?blAsDN3Q7XnL47NBhZnWEwmW8nPliovb8xCHnGs4sqgZH9Km?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bda8b91-c3db-4004-54f8-08de58033380
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 09:06:30.5332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1+agwsCefig0oD1ldFZcP9FyKME/sEpLpIf6uYtFVX30soByaCOy1LKcggD5yNvTSX9+WkBmnHhALQw+zGo8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6498
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
> Sent: 19 January 2026 10:45
> To: S, Sowmiya <sowmiya.s@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor writeback=
-
> check-output subtest
>=20
>=20
> > Subject: [PATCH i-g-t v6 7/8] tests/kms_writeback: Refactor
> > writeback-check- output subtest
> >
> > Remove individual tests for each format for the test
> > writeback-check-output and introduce dynamic subtest generation based
> > on the formats supported.Framebuffer creation was now part of the
> > subtest level based on the format and removed from fixture.
> >
> > v4: -create testcase for BGR8888 format only for intel
> >     platforms.(Suraj)
> > v5: -update the documentation for dynamic subtest
> >     -update version info (Suraj)
> > v6: -Remove in_fb inside subtest and reuse input_fb from
> >      fixture (Suraj)
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/kms_writeback.c | 57
> > +++++++++++++++++++------------------------
> >  1 file changed, 25 insertions(+), 32 deletions(-)
> >
> > diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> > 0ed86c865..66da5603a 100644
> > --- a/tests/kms_writeback.c
> > +++ b/tests/kms_writeback.c
> > @@ -45,11 +45,10 @@
> >  #include "sw_sync.h"
> >
> >  /**
> > - * SUBTEST: writeback-check-output-XRGB2101010
> > - * Description: Check XRGB2101010 writeback output with CRC
> > validation
> > - *
> >   * SUBTEST: writeback-check-output
> > - * Description: Check writeback output with CRC validation
> > + * Description: Check writeback output with CRC validation.This test
> > ++ *             dynamically generates subtests for each supported pixe=
l
> > ++ *             format (e.g., XBGR8888) and configuration.
> >   *
>=20
> Same as last fix documentation

Dynamic subtests do not need to be documented.
=20
>=20
> >   * SUBTEST: writeback-fb-id
> >   * Description: Validate WRITEBACK_FB_ID with valid and invalid
> > options @@
> > -712,7 +711,6 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> > opt_handler, NULL)
> >
> > get_default_fb_format(&display, bpc),
> >  						      igt_fb_mod_to_tiling(0),
> >  						      &output_fb);
> > -
> >  				igt_skip_on(data.dump_check ||
> > data.list_modes);
> >  				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> >  					      "DRM_FORMAT_%s is not
> > supported\n", @@ -724,38 +722,33 @@ int igt_main_args("b:c:f:dl",
> > long_options, help_str, opt_handler, NULL)
> >  	}
> >
> >  	igt_describe("Check writeback output with CRC validation");
> > -	igt_subtest("writeback-check-output") {
> > -		igt_fb_t output_fb;
> > +	igt_subtest_with_dynamic("writeback-check-output") {
> > +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> > +			uint32_t test_format =3D fourcc[i];
> >
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors &
> > XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB8888,
> > -				      igt_fb_mod_to_tiling(0),
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > +			if (is_intel_device(display.drm_fd))
> > +				if (!strstr(igt_format_str(test_format),
> > "BGR8888"))
>=20
> Join conditions with && instead of nesting
>=20
I will rectify it in next rev.

Regards,
Sowmiya

> Regards,
> Suraj Kandpal
>=20
> > +					continue;
> > +			igt_dynamic_f("writeback-check-output-%s",
> > igt_format_str(test_format)) {
> > +				igt_fb_t output_fb;
> > +				int bpc =3D
> > igt_drm_format_get_bpc(test_format);
> >
> > -		writeback_check_output(output, plane, &input_fb,
> > &output_fb, DRM_FORMAT_XRGB8888);
> > +				fb_id =3D igt_create_fb(display.drm_fd,
> > mode.hdisplay, mode.vdisplay,
> > +
> > get_default_fb_format(&display, bpc),
> > +						      igt_fb_mod_to_tiling(0),
> > +						      &output_fb);
> >
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > +				igt_skip_on(data.dump_check ||
> > data.list_modes);
> > +				igt_skip_on_f(!(data.supported_colors & (1 <<
> > i)),
> > +					      "DRM_FORMAT_%s is not
> > supported\n",
> > +					      igt_format_str(test_format));
> > +				writeback_check_output(output, plane, (bpc
> > =3D=3D 8) ? &input_fb :
> > +						       &input_fb_10bit,
> > &output_fb, test_format);
> > +				igt_remove_fb(display.drm_fd, &output_fb);
> > +			}
> > +		}
> >  	}
> >
> > -	igt_describe("Check XRGB2101010 writeback output with CRC
> > validation");
> > -	igt_subtest("writeback-check-output-XRGB2101010") {
> > -		igt_fb_t output_fb;
> > -
> > -		igt_skip_on(data.dump_check || data.list_modes);
> > -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> > "DRM_FORMAT_XRGB2101010 is unsupported\n");
> > -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> > mode.vdisplay,
> > -				      DRM_FORMAT_XRGB2101010,
> > -				      igt_fb_mod_to_tiling(0),
> > -				      &output_fb);
> > -		igt_require(fb_id > 0);
> > -
> > -		writeback_check_output(output, plane, &input_fb_10bit,
> > &output_fb, DRM_FORMAT_XRGB2101010);
> > -
> > -		igt_remove_fb(display.drm_fd, &output_fb);
> > -	}
> >
> >  	igt_fixture() {
> >  		cleanup_writeback(&display, output);
> > --
> > 2.43.0

