Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145FFD4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F1B10E261;
	Mon, 19 Jan 2026 05:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVYJvue1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0637010E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768799521; x=1800335521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=57NePramhKmJgqaHTQ0eW8KuYCjLD0Wt42pIHGCR5JE=;
 b=UVYJvue1L+3TwuPVbwQqHm2qk57F51P1BZj7YqEQnXfCRx804G2Iwoq1
 ji3FMEk/zgxEpdTTdlBUzSD3K8rDvC5vS0MrI8Oq9+Zjzro1i05cKPxsj
 SudgI88DdUU1yJGZ1i1xyhdfsciwWKqAXIz2plLFGbOvHT2EPn31KDuU4
 Rmpipza/W6UlqqMqXKpxlzTZFb0GUVy/s6S+eqdcVtOUbxG/5mVKTlRpk
 EWM1Fis/ZcjS+DnbpglfNmvIAZz8BoA6crts7tJj2X73MqfQyu4NG06zV
 PW5UuZXk/ieIk/PizmE7ePxAEThcYuPQt911eKxDHOdkRkbTU30EoewdO g==;
X-CSE-ConnectionGUID: imaIv3BmTYWZnWPmgce8MQ==
X-CSE-MsgGUID: 59y5QWmXRWy+uiLxBAJJ8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80642822"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="80642822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:12:01 -0800
X-CSE-ConnectionGUID: pE8ZuXXBRgy6smR8/CLrGg==
X-CSE-MsgGUID: tynA248DQ9u6Se29Kd0cIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="237052810"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:12:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 21:12:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 21:12:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:11:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uc3X/4u7z/qZVJPzEbu/sGYbmzsN2XknCPu3AbOlp7wIDWzotGoxYvYj0AHZaiHsJzDp2x24r28GIxQ6eddztAp/z512aY4B/PuorMtwdY2uas8HkdJJASc7hv9qzsXj8WXoaB64oBu2awK1zO4gG9zbXUacIfs6kgaE10aBXkw7kBCdefekLEsOLmOgXrIXWqCDMeFLZYPl9kM4jn54ZOrk3yOC4/zlyI3GvMVcW6oTwUOOyU/tXYtkgFy7TPkr1xgSmg6ASWPWflHzkXlvnwmufs0HImuMSCVdEMjavroYbD96uYNbL9mTvAl+gvF8j6X69I08s4kzKCOlkhAeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXkGVSzX3Ll+Vn3nVvXihmi3yQfbXALsHaUkrwSBa8I=;
 b=HikN6Ak+6VTwloxVB4sIHdodnoMT4gcD5TMmVMKBIjibHGgbkXBKeZ3DOUUuFWlXoseJQe2oobkvnyPUyP0U2ZzTTc/kPv0CLzdIQVSZFqCnTz+chDNF1/b4J90eXWaiUX4MwEyqlO0pvoIkAdzoTPNNBQ/yuzeRpOfk+zLKIeLWcETFj2LXY9urSmz4Bpoa5fYPWg+3NGplSrVNJ5VW4ovE6FPkT4YZLXmH37OLx6DN7Rx/bEfivW2ZTKkd3msU9kaNRo9b8vF0LFhz3fItkUJ38ZjqKK4znprZuYSJmziv39iOtWhIpZLfROz4RDqVrD6TcYfr9M6m824QK8onvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN0PR11MB5961.namprd11.prod.outlook.com
 (2603:10b6:208:381::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 05:11:57 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:11:57 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7XkgC+KpYm20eTttXamoODnrVY8afA
Date: Mon, 19 Jan 2026 05:11:57 +0000
Message-ID: <DM3PPF208195D8DF52BB0D3BE58C7D4F1E9E388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
In-Reply-To: <20260119050732.110985-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN0PR11MB5961:EE_
x-ms-office365-filtering-correlation-id: d2f999b1-baf5-44d2-3785-08de57194504
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?5T6rTpIB7o3L3zH68CsIuWkIxmkMarJnJ301BCAo9lqXnETknIkY9s/ij9pd?=
 =?us-ascii?Q?lZA41GsydBkX6hHjWstNlzEA+TxeGXgRA2oLfX54X3xkgqS//BmHTuFWebQG?=
 =?us-ascii?Q?X6EVqpDu3AYjOU3N3XN7blJKqmAivXc7n9sMo3xfHhFPkzF94hssi9jjwJlC?=
 =?us-ascii?Q?D3Q/3BP2JBQy5GfYer3Clfw3tpyvOct75SoW+2oua2BO7W86r/k6tezb5yeo?=
 =?us-ascii?Q?dYR0TedMO4oqwsDfln11NRbC+PRfgLjYrt7byLxwwH067RWx6ULmYcekDlM7?=
 =?us-ascii?Q?/1iOkU6+NJuQsEb1wfEwesOJWbluwKnlhk84p2+KRAA+xJpeF/5TjAH5u+4C?=
 =?us-ascii?Q?8KsHyDQr4xqyklrqZ/NaRXRXTfTnxg8s/30Xs3GjHqJC3b7X7m56C3ceTLUr?=
 =?us-ascii?Q?iXxuZN8zT88mTd5LV/KreZ6Ld5elvXdAt4RjHpfX/rBhwbhDSkNfeBGO6k1A?=
 =?us-ascii?Q?SJzGZA/49blGcV8L18YfTYxQT0RSmHHxM0RAZ/ZokaXOQg+BrJP7DxvkmJGm?=
 =?us-ascii?Q?0kJ4QBqp6nAI7eYgRwMB9pnVpZjAYfWdVeUDAGiUgnTbLn0TfkHOfW61/DFR?=
 =?us-ascii?Q?NEkOwu9gR6klKx2ueJYLlLZqQ0lKOiUD9SfHiqyZXLV9catX8whkkZ7gsYRH?=
 =?us-ascii?Q?dCvbvnbeJOYbL+NrqOscfmHgA0eefPb8T4tBcTPuWFDpH+Nmm6PyXmcRIH8l?=
 =?us-ascii?Q?qH5fLWToP6qPeyizc/Gyv4TaDMBdfFxw2VtxP3slDVeXM8VT3jMODuulZBtq?=
 =?us-ascii?Q?SfNCA9XYD7B+HT1pYa0mHt2KXey3pHnBpF39Px+cFvijD2/0trpjbSFIzV/0?=
 =?us-ascii?Q?YtqEDam8JFbJcJxPJy/Rd+mE5vOVa2HxXfx+h/F6PBjTEeCXFYin1kRthbhU?=
 =?us-ascii?Q?k3w+28Nal2syGaRw7cn9WP5fAmXyhv3dVh4ocfO4Myu+gtkxCtFkVMw478/N?=
 =?us-ascii?Q?tufPXnZJW8VGbz9u06WAzeMI3dSxlHelIozUeRDpaBjLZDm9CfyJcQB1TDx0?=
 =?us-ascii?Q?ufFWHr1SOF/fU+igpo/6w4yrrUDbmPjuty/icEDi3t08VTPO//y5sFLBVxXV?=
 =?us-ascii?Q?ZyDiKzOl3lPvarLOVd961FxwLVTqEP9WGbec61OdSSB76pIk5+dViLVFcHBR?=
 =?us-ascii?Q?pd+9tL6law/vyRhtJCjJRwM3xfSgIXyuAolhlWNUxuYdVg9xCxvFtQGAUsvO?=
 =?us-ascii?Q?Unql+g8ju7K3Yi6+ySAaRVsVia4ZIG5qOkHL1ZlhoWQREBhsTVFoKhP243bc?=
 =?us-ascii?Q?kwkLGWkL1Q0n7TJWAvl/5OAEL52T3tecVb5cOXJCieFlTM2U3Ccny0QMFT0L?=
 =?us-ascii?Q?aVkAni4rMYmRWIXf42S0x8/zm5DFBx6EopXAngwkLZJHWr72BoDROthFEpiA?=
 =?us-ascii?Q?fRDVZXUMoho6KK5Fbl3R0daIzzYtTUBsSROLtZY4SVyX4PePs0UbAM+M7j8l?=
 =?us-ascii?Q?kempOlkcFi0YLpeRbgReUdjpFSAklmUo2nNB1Y9F7pxBE2//2K/0hKWi8D5B?=
 =?us-ascii?Q?lBC9jpHOHGxBcnj2OciVSQHQBDqS8Oq4ofRU1R6pAvXvbUn4DCmdebC+EzMA?=
 =?us-ascii?Q?PK8d1o7HR4Agj48VLjaejIfi//hYxNjskA9ZVxkEcYhfDj389VKXVYcpSkzq?=
 =?us-ascii?Q?Hih3NYYO0Y+1jLjZxZzJK9E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2SZRomBfTh+mH4cvxktaHIcb9BFcYyzB7FOhOEZt2ylSHmrGaItjbPekzfkv?=
 =?us-ascii?Q?L9zbjBE0hrqZLlK52Rez3c8Hsl38IC22Ug/EYzvji4x6RzRHuepPeSoM0LCr?=
 =?us-ascii?Q?BpQOa331pVnvEmgyfQH6gK+PlhpZrdebXWswR3Q2TzyTls9C0RhUzaoTik1G?=
 =?us-ascii?Q?6Gi/I7wMJGdSPejswGyGjVAxf7JyTuaCIdxziu1hDg2HlUGN4WZnGWdyLcND?=
 =?us-ascii?Q?X481kyMbRie37odvBHZFalK3bukZK/26ILD1xmSCCeCyAttMndAiLOenuVS6?=
 =?us-ascii?Q?izLz7rmNcpxIVqarp2rRCzNvlR2tD+xDM9dFaYlnEWrCJY8/UmJSBr4TgTxA?=
 =?us-ascii?Q?T/RVtx8rlVomUbsRNMlTSZ8Zm2z2lNaQT8dIn1wzS+l1Grml5+iBrrx8/6V1?=
 =?us-ascii?Q?qmNFHGxWTE3aIiY/qMPuM+/kszmfeKqv0Lou8t4UE+bv9bnB2RQHqbASnkHw?=
 =?us-ascii?Q?7NjvnexjWwAPHC7gWUoE8M8d/voDj0adSKvXJVOY0IznEGF06hK5ztWUusRw?=
 =?us-ascii?Q?JdWHVbVLkXMYF9gvydsjbGP0KitOdHcibH3vFKNACqr9syt7oV1XEmVIIMf7?=
 =?us-ascii?Q?aFsBXvv93x060iy31l6MpUU0zYqf4fIKxdj7kiuinU5iMxVJzDK30OvHIbvR?=
 =?us-ascii?Q?ma0BSZo93iWQ+vhPKBkYULm6rWdszfyct847QkH5KV+URZkaJTQR6XqAI4D4?=
 =?us-ascii?Q?Z0dn2ACRKBO5u4nEgO/E/+L7BlsJqIwzEq0ZfUVJ36RZLlcLXs6oWo35/w0t?=
 =?us-ascii?Q?MNpvMMgywe7EjjPfXlmjxeuXpSvNLkqNOOZAKbRa3SkcgGCuABzeWqcqMNIY?=
 =?us-ascii?Q?bUgSYefHWHuQlUBg5t6pv8hcw+O1HV0i5ibPBXj7+q9hjagHFf6M3fBNoZDU?=
 =?us-ascii?Q?uN7Gdhz+MaXUl8Httc2f8irKX4IepHPzDMxbXeKxE/aTI3vpcJwYFxaKV6NO?=
 =?us-ascii?Q?BmId7oaROgxTNwKywAav1YT8JDtEzQHckWgwHGbtjL4/Lo/oIxE3vG1NdrFd?=
 =?us-ascii?Q?ehNfZMKv6Z9a8VTyou4hEYPvifFWu52pXjw4+dB8xuKIp37bwGnOwDfuXVtL?=
 =?us-ascii?Q?qy4y62kg+dT8Kf8Xnxt4uIFfaFVBKM3J8KrYUrIkU5Ql0pDYOds0TF2pde+q?=
 =?us-ascii?Q?dRvMQq3gYNt+Vxia86quGE1Ln/7CIRj4RsmlZbAvV4NTdNF+vCB12WoSIRG/?=
 =?us-ascii?Q?jjPa1fYo7jG1U7VZP81RSfUJsnCrRh5XJ7ZAzNbLFwBgyX6pzC16gKbTW/3W?=
 =?us-ascii?Q?8rd+wQ8RSoD//Izmkjsy8f+TVnBg6+9c7YWzBlRmxhryANbiT1nth5wSOzTB?=
 =?us-ascii?Q?NSRJgm2UYW5t8LQUMhFClqFEItooYSEQtL7Vj381dCXIWv6UJMguv9mv1WVP?=
 =?us-ascii?Q?ssFHnTJA861FmceLZmv9Q7hX0JSWm10t7y8P1SGSjiZqaoM0jNE2Nu8KtcEA?=
 =?us-ascii?Q?KM63AsWM4SLyu6Rk7xxGYACCh9Py2nVJ5S+X/STUBz9qY+RMse36oDTdcq9R?=
 =?us-ascii?Q?UGiq5JcEvyoJXwNNY3rD9AzSGIfInyJWzkZ2vduoKUoQsXrm9Mrb4Wcaz5HI?=
 =?us-ascii?Q?j5b2Xx3uVdpYxCa6vSTMGLjStCA7W8EGmV96xqyK7u5cmbnPWveXZkWBouJ5?=
 =?us-ascii?Q?0cJDYkTQPIPZdgdcHZUg9YPc7apMjMeFz0OdTKdOjJRk5E3A8imfdlrcIs4X?=
 =?us-ascii?Q?gDL//46w/jFP8cXKWH6id6Ilim4Dg99FatyhIOk7Rn7JWTr039dn8pAfEuMn?=
 =?us-ascii?Q?EkTuQKRJxA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f999b1-baf5-44d2-3785-08de57194504
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:11:57.6355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTkOn21dlG0gaIWdsu8vmWB9PzxcsIfruf+SeNMq4cCsqWsAAfOOw2QnLBc7G7JQ1x4pJWN4GEG0gcsVghoy/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
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

> Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback-fb-=
id
> subtest
>=20
> Remove individual tests for each format for the test writeback-fb-id and
> introduce dynamic subtest generation based on the formats supported.
> Framebuffer creation was now part of the subtest level based on format.
>=20
> v4: squashed the FB creation function with this commit (Suraj)
> v5: -Update dynamic subtest documentation (Suraj)
>     -Rename input_fb to in_fb
>     -Set plane to in_fb and remove unused input_fb as an arg to
>      writeback-fb-id function.
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 60 ++++++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 35 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 63917bf4f..0ed86c865 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> *output, igt_fb_t *valid_fb, ig
>  	}
>  }
>=20
> -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, ig=
t_fb_t
> *invalid_fb)
> +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)
>  {
>=20
>  	int ret;
> @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options, help_st=
r,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> and invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
> +			int bpc =3D igt_drm_format_get_bpc(test_format);
> +
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))
> +					continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
> +
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				writeback_fb_id(output, &output_fb);

You have also started using output fb as valid fb  we previously used input=
_fb as valid fb please be mindful of your
Changes and mention these changes and why they are needed.

Regards,
Suraj Kandpal

> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

